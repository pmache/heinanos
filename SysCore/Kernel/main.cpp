/******************************************************************************
   main.cpp
		-main kernel file
	Part of HeinanOS Operating System
******************************************************************************/

/**Build 26
----------

NEW:

string.cpp:  strchr()
fat12.h/cpp: FAT12 minidriver
fsys.h/cpp:  VFS
main.cpp:    READ command updated
htfs.h/cpp:	HTFS (Heinan's Technology File System) minidriver

KNOWN BUGS:

-There is a bug found in get_cmd(). It seems to add 1 extra character to the buffer
 when the entered text is all caps. Works fine if its in lowercase

-In volOpenFile(), fsys.cpp: if input contains ':', an additional character, 0x2, is added
 before ':' on input of function. For example, a:main.cpp becomes:

 'a' '' ':' 'm' 'a' 'i' 'n' '.' 'c' 'p' 'p' ''

-. and .. in pathnames also dont seem to work. Need to look into

Currently a workaround is provided in the routine.
I'm working on fixing this, please be patient. :-)
**/

#include <bootinfo.h>
#include <hal.h>
#include <kybrd.h>
#include <string.h>
#include <flpydsk.h>
#include <HTFS.h>
#include <stdio.h>
#include "DebugDisplay.h"
#include "exception.h"
#include "mmngr_phys.h"
#include "mmngr_virtual.h"

/**
*	Memory region
*/
struct memory_region {

	uint32_t	startLo;	//base address
	uint32_t	startHi;
	uint32_t	sizeLo;		//length (in bytes)
	uint32_t	sizeHi;
	uint32_t	type;
	uint32_t	acpi_3_0;
};

uint32_t kernelSize=0;

/**
*	Initialization
*/
void init (multiboot_info* bootinfo) {

	//! initialize our vmm
	vmmngr_initialize ();

	//! clear and init display
	DebugClrScr (0x0);
	DebugGotoXY (0,0);
	DebugSetColor (0x7);

	hal_initialize ();

	enable ();
	setvect (0,(void (__cdecl &)(void))divide_by_zero_fault);
	setvect (1,(void (__cdecl &)(void))single_step_trap);
	setvect (2,(void (__cdecl &)(void))nmi_trap);
	setvect (3,(void (__cdecl &)(void))breakpoint_trap);
	setvect (4,(void (__cdecl &)(void))overflow_trap);
	setvect (5,(void (__cdecl &)(void))bounds_check_fault);
	setvect (6,(void (__cdecl &)(void))invalid_opcode_fault);
	setvect (7,(void (__cdecl &)(void))no_device_fault);
	setvect (8,(void (__cdecl &)(void))double_fault_abort);
	setvect (10,(void (__cdecl &)(void))invalid_tss_fault);
	setvect (11,(void (__cdecl &)(void))no_segment_fault);
	setvect (12,(void (__cdecl &)(void))stack_fault);
	setvect (13,(void (__cdecl &)(void))general_protection_fault);
	setvect (14,(void (__cdecl &)(void))page_fault);
	setvect (16,(void (__cdecl &)(void))fpu_fault);
	setvect (17,(void (__cdecl &)(void))alignment_check_fault);
	setvect (18,(void (__cdecl &)(void))machine_check_abort);
	setvect (19,(void (__cdecl &)(void))simd_fpu_fault);

	pmmngr_init (bootinfo->m_memorySize, 0xC0000000 + kernelSize*512);

	memory_region*	region = (memory_region*)0x1000;

	for (int i=0; i<10; ++i) {

		if (region[i].type>4)
			break;

		if (i>0 && region[i].startLo==0)
			break;

		pmmngr_init_region (region[i].startLo, region[i].sizeLo);
	}
	pmmngr_deinit_region (0x100000, kernelSize*512);

	//! install the keyboard to IR 33, uses IRQ 1
	kkybrd_install (33);

	//! set drive 0 as current drive
	flpydsk_set_working_drive (0);

	//! install floppy disk to IR 38, uses IRQ 6
	flpydsk_install (38);

	//! initialize HTFS filesystem
	fsysFatInitialize ();
}

//! sleeps a little bit. This uses the HALs get_tick_count() which in turn uses the PIT
void sleep (int ms) {

	static int ticks = ms + get_tick_count ();
	while (ticks > get_tick_count ())
		;
}

//! wait for key stroke
KEYCODE	getch () {

	KEYCODE key = KEY_UNKNOWN;

	//! wait for a keypress
	while (key==KEY_UNKNOWN)
		key = kkybrd_get_last_key ();

	//! discard last keypress (we handled it) and return
	kkybrd_discard_last_key ();
	return key;
}

//! command prompt
void cmd () {
	DebugPrintf ("\nA:\\ ");
}

//! gets next command
void get_cmd (char* buf, int n) {

	KEYCODE key = KEY_UNKNOWN;
	bool	BufChar;

	//! get command string
	int i=0;
	while ( i < n ) {

		//! buffer the next char
		BufChar = true;

		//! grab next char
		key = getch ();

		//! end of command if enter is pressed
		if (key==KEY_RETURN)
			break;

		//! backspace
		if (key==KEY_BACKSPACE) {

			//! dont buffer this char
			BufChar = false;

			if (i > 0) {

				//! go back one char
				unsigned y, x;
				DebugGetXY (&x, &y);
				if (x>0)
					DebugGotoXY (--x, y);
				else {
					//! x is already 0, so go back one line
					y--;
					x = DebugGetHorz ();
				}

				//! erase the character from display
				DebugPutc (' ');
				DebugGotoXY (x, y);

				//! go back one char in cmd buf
				i--;
			}
		}

		//! only add the char if it is to be buffered
		if (BufChar) {

			//! convert key to an ascii char and put it in buffer
			char c = kkybrd_key_to_ascii (key);
			if (c != 0) { //insure its an ascii char

				DebugPutc (c);
				buf [i++] = c;
			}
		}

		//! wait for next key. You may need to adjust this to suite your needs
		sleep (10);
	}

	//! null terminate the string
	buf [i] = '\0';
}

//! read command
void cmd_read (char *path) {

	//! get pathname
	DebugClrScr(0x0);
	DebugGotoXY(0,0);
	DebugPuts("HeinanOS Reader");
	DebugPuts("+-----------------+");
	//! open file
	FILE file = volOpenFile (path);

	//! test for invalid file
	if (file.flags == FS_INVALID) {

		DebugPrintf ("\n\rUnable to open file");
		return;
	}

	//! cant display directories
	if (( file.flags & FS_DIRECTORY ) == FS_DIRECTORY) {

		DebugPrintf ("\n\rUnable to display contents of directory.");
		return;
	}

	//! top line
	DebugPrintf ("\n\n\r-------[%s]-------\n\r", file.name);

	//! display file contents
	while (file.eof != 1) {

		//! read cluster
		unsigned char buf[512];
		volReadFile ( &file, buf, 512);

		//! display file
		for (int i=0; i<512; i++)
			DebugPutc (buf[i]);

		//! wait for input to continue if not EOF
		if (file.eof != 1) {
			DebugPrintf ("\n\r------[Press a key to continue]------");
			getch ();
			DebugPrintf ("\r"); //clear last line
		}
	}

	//! done :)
	DebugPrintf ("\n\n\rPress any key ro return to the CLI..");
	getch();
	DebugClrScr(0x0);
	DebugGotoXY (0,0);
	DebugPuts ("HeinanOS 1.0 \nCopyright (C) Heinan Cabouly 2010\n");
	DebugPuts ("\nType \"exit\" to quit, \"help\" for a list of commands\n");
	DebugPuts ("+-------------------------------------------------------+\n");
}

//! our simple command parser
bool run_cmd (char* cmd_buf) {
	char path[32];
	//! exit command
	if (strcmp (cmd_buf, "poweroff") == 0) {
		return true;
	}

	//! clear screen
	else if (strcmp (cmd_buf, "clrscn") == 0) {
		DebugClrScr (0x0);
	DebugGotoXY (0,0);
	DebugPuts ("HeinanOS 1.0 \nCopyright (C) Heinan Cabouly 2010\n");
	DebugPuts ("\nType \"exit\" to quit, \"help\" for a list of commands\n");
	DebugPuts ("+-------------------------------------------------------+\n");
	
	}

	//! help
	else if (strcmp (cmd_buf, "help") == 0) {

		DebugPuts ("\n\nHeinanOS\n");
		DebugPuts ("Supported commands:\n");
		DebugPuts (" - poweroff: quits and halts the system\n");
		DebugPuts (" - clrscn: clears the display\n");
		DebugPuts (" - help: displays this message\n");
		DebugPuts (" - hosver: displayes information about HeinanOS\n");
		DebugPuts (" - read: reads file(s) from the disk\n");
		DebugPuts (" - reset: Resets and recalibrates floppy for reading\n");
		DebugPuts (" - conclusions: See some interesting facts about HeinanOS developing process\n\n");
	}

	//! read sector
	else if (strcmp (cmd_buf, "read") == 0) {
		DebugPuts ("\n\nPlease input the path to the file you wish to read: ");
		get_cmd (path,32);
		cmd_read (path);
	}
	
	else if (strcmp (cmd_buf, "hosver") == 0) {
	DebugPuts ("\n\nHeinanOS\nVersion 1.0 (Build 26c.hos_main.x86fre.20100528-2250)\n\nCopyright (C) Heinan Cabouly 2010\n\n");
	}

	else if (strcmp (cmd_buf, "sleep") == 0) {
	DebugPuts ("\n\nPress any key to suspend the system..\n\n");
	sleep(131128);
	
	}


	else if (strcmp (cmd_buf, "reset")==0) {
	DebugPuts ("\n\nDisk read error!\n\n");
	}

	else if (strcmp (cmd_buf, "conclusions")==0) {
		DebugPuts ("\n\nThis feature is not yet implemented!\n\n");
	}

	//! invalid command
	else {
		DebugPrintf ("\nUnkown command recived");
	}

	return false;
}

void run () {

	//! command buffer
	char	cmd_buf [100];

	while (1) {

		//! display prompt
		cmd ();

		//! get command
		get_cmd (cmd_buf, 98);

		//! run command
		if (run_cmd (cmd_buf) == true)
			break;
	}
}

int _cdecl kmain (multiboot_info* bootinfo) {

	_asm	mov	word ptr [kernelSize], dx
	
	init (bootinfo);

	DebugGotoXY (30,10);
	DebugPuts ("Welcome to HeinanOS!");
	DebugGotoXY (25,12);
	DebugPuts ("Press any key to launch the CLI...");
	DebugGotoXY (0,24);
	DebugPuts ("This message will only be displayed during the HeinanOS testing process");
	getch();
	DebugClrScr(0x0);
	DebugPuts ("HeinanOS 1.0 \nCopyright (C) Heinan Cabouly 2010\n");
	DebugPuts ("\nType \"poweroff\" to quit, \"help\" for a list of commands\n");
	DebugPuts ("+-------------------------------------------------------+\n");
	run ();

	DebugClrScr(0x0);
	DebugGotoXY(30,12);
	DebugPuts("Thank you for using HeinanOS!");
	getch();
	DebugClrScr(0x0);
	for (;;);
	return 0;
	
}

