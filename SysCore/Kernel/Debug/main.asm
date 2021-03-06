; Listing generated by Microsoft (R) Optimizing Compiler Version 14.00.50727.42 

	TITLE	c:\Users\Heinan\Documents\Visual Studio 2005\Projects\HeinanOS\SysCore\Kernel\main.cpp
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

PUBLIC	?logo@@3PADA					; logo
_DATA	SEGMENT
?logo@@3PADA DD	FLAT:$SG2688				; logo
_DATA	ENDS
CONST	SEGMENT
$SG2688	DB	'HeinanOS ', 0aH, 'Copyright (C) Heinan Cabouly 2010', 0aH
	DB	0aH, 0aH, 00H
	ORG $+1
$SG2727	DB	'PIC, PIT, and exception handlers are installed!', 0aH, 0aH
	DB	00H
	ORG $+6
$SG2728	DB	'Hitting any key will fire the default HAL handlers as cu'
	DB	'rrently', 0aH, 00H
	ORG $+3
$SG2729	DB	'no keyboard driver is installed.', 0aH, 0aH, 00H
	ORG $+1
$SG2730	DB	'Your cpu vender: %s ', 0aH, 0aH, 00H
	ORG $+1
$SG2734	DB	'Current tick count: %i', 00H
CONST	ENDS
PUBLIC	_main
EXTRN	?get_tick_count@@YAHXZ:PROC			; get_tick_count
EXTRN	?DebugPrintf@@YAHPBDZZ:PROC			; DebugPrintf
EXTRN	?get_cpu_vender@@YAPBDXZ:PROC			; get_cpu_vender
EXTRN	?DebugPuts@@YAXPAD@Z:PROC			; DebugPuts
EXTRN	?DebugSetColor@@YAII@Z:PROC			; DebugSetColor
EXTRN	?DebugGotoXY@@YAXII@Z:PROC			; DebugGotoXY
EXTRN	?DebugClrScr@@YAXE@Z:PROC			; DebugClrScr
EXTRN	?simd_fpu_fault@@YAXIII@Z:PROC			; simd_fpu_fault
EXTRN	?machine_check_abort@@YAXIII@Z:PROC		; machine_check_abort
EXTRN	?alignment_check_fault@@YAXIIII@Z:PROC		; alignment_check_fault
EXTRN	?fpu_fault@@YAXIII@Z:PROC			; fpu_fault
EXTRN	?page_fault@@YAXIIII@Z:PROC			; page_fault
EXTRN	?general_protection_fault@@YAXIIII@Z:PROC	; general_protection_fault
EXTRN	?stack_fault@@YAXIIII@Z:PROC			; stack_fault
EXTRN	?no_segment_fault@@YAXIIII@Z:PROC		; no_segment_fault
EXTRN	?invalid_tss_fault@@YAXIIII@Z:PROC		; invalid_tss_fault
EXTRN	?double_fault_abort@@YAXIIII@Z:PROC		; double_fault_abort
EXTRN	?no_device_fault@@YAXIII@Z:PROC			; no_device_fault
EXTRN	?invalid_opcode_fault@@YAXIII@Z:PROC		; invalid_opcode_fault
EXTRN	?bounds_check_fault@@YAXIII@Z:PROC		; bounds_check_fault
EXTRN	?overflow_trap@@YAXIII@Z:PROC			; overflow_trap
EXTRN	?breakpoint_trap@@YAXIII@Z:PROC			; breakpoint_trap
EXTRN	?nmi_trap@@YAXIII@Z:PROC			; nmi_trap
EXTRN	?single_step_trap@@YAXIII@Z:PROC		; single_step_trap
EXTRN	?setvect@@YAXHA6AXXZ@Z:PROC			; setvect
EXTRN	?divide_by_zero_fault@@YAXIII@Z:PROC		; divide_by_zero_fault
EXTRN	?enable@@YAXXZ:PROC				; enable
EXTRN	?hal_initialize@@YAHXZ:PROC			; hal_initialize
; Function compile flags: /Ogtpy
; File c:\users\heinan\documents\visual studio 2005\projects\heinanos\syscore\kernel\main.cpp
_TEXT	SEGMENT
_main	PROC

; 20   : 
; 21   : 	//! Initialize hal driver
; 22   : 	hal_initialize ();

	call	?hal_initialize@@YAHXZ			; hal_initialize

; 23   : 
; 24   : 	//! enable all interrupts
; 25   : 	enable ();

	call	?enable@@YAXXZ				; enable

; 26   : 
; 27   : 	//! install our exception handlers
; 28   : 	setvect (0,(void (__cdecl &)(void))divide_by_zero_fault);

	push	OFFSET ?divide_by_zero_fault@@YAXIII@Z	; divide_by_zero_fault
	push	0
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 29   : 	setvect (1,(void (__cdecl &)(void))single_step_trap);

	push	OFFSET ?single_step_trap@@YAXIII@Z	; single_step_trap
	push	1
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 30   : 	setvect (2,(void (__cdecl &)(void))nmi_trap);

	push	OFFSET ?nmi_trap@@YAXIII@Z		; nmi_trap
	push	2
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 31   : 	setvect (3,(void (__cdecl &)(void))breakpoint_trap);

	push	OFFSET ?breakpoint_trap@@YAXIII@Z	; breakpoint_trap
	push	3
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 32   : 	setvect (4,(void (__cdecl &)(void))overflow_trap);

	push	OFFSET ?overflow_trap@@YAXIII@Z		; overflow_trap
	push	4
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 33   : 	setvect (5,(void (__cdecl &)(void))bounds_check_fault);

	push	OFFSET ?bounds_check_fault@@YAXIII@Z	; bounds_check_fault
	push	5
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 34   : 	setvect (6,(void (__cdecl &)(void))invalid_opcode_fault);

	push	OFFSET ?invalid_opcode_fault@@YAXIII@Z	; invalid_opcode_fault
	push	6
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 35   : 	setvect (7,(void (__cdecl &)(void))no_device_fault);

	push	OFFSET ?no_device_fault@@YAXIII@Z	; no_device_fault
	push	7
	call	?setvect@@YAXHA6AXXZ@Z			; setvect
	add	esp, 64					; 00000040H

; 36   : 	setvect (8,(void (__cdecl &)(void))double_fault_abort);

	push	OFFSET ?double_fault_abort@@YAXIIII@Z	; double_fault_abort
	push	8
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 37   : 	setvect (10,(void (__cdecl &)(void))invalid_tss_fault);

	push	OFFSET ?invalid_tss_fault@@YAXIIII@Z	; invalid_tss_fault
	push	10					; 0000000aH
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 38   : 	setvect (11,(void (__cdecl &)(void))no_segment_fault);

	push	OFFSET ?no_segment_fault@@YAXIIII@Z	; no_segment_fault
	push	11					; 0000000bH
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 39   : 	setvect (12,(void (__cdecl &)(void))stack_fault);

	push	OFFSET ?stack_fault@@YAXIIII@Z		; stack_fault
	push	12					; 0000000cH
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 40   : 	setvect (13,(void (__cdecl &)(void))general_protection_fault);

	push	OFFSET ?general_protection_fault@@YAXIIII@Z ; general_protection_fault
	push	13					; 0000000dH
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 41   : 	setvect (14,(void (__cdecl &)(void))page_fault);

	push	OFFSET ?page_fault@@YAXIIII@Z		; page_fault
	push	14					; 0000000eH
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 42   : 	setvect (16,(void (__cdecl &)(void))fpu_fault);

	push	OFFSET ?fpu_fault@@YAXIII@Z		; fpu_fault
	push	16					; 00000010H
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 43   : 	setvect (17,(void (__cdecl &)(void))alignment_check_fault);

	push	OFFSET ?alignment_check_fault@@YAXIIII@Z ; alignment_check_fault
	push	17					; 00000011H
	call	?setvect@@YAXHA6AXXZ@Z			; setvect
	add	esp, 64					; 00000040H

; 44   : 	setvect (18,(void (__cdecl &)(void))machine_check_abort);

	push	OFFSET ?machine_check_abort@@YAXIII@Z	; machine_check_abort
	push	18					; 00000012H
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 45   : 	setvect (19,(void (__cdecl &)(void))simd_fpu_fault);

	push	OFFSET ?simd_fpu_fault@@YAXIII@Z	; simd_fpu_fault
	push	19					; 00000013H
	call	?setvect@@YAXHA6AXXZ@Z			; setvect

; 46   : 
; 47   : 	//! clear and init display
; 48   : 	DebugClrScr (0x13);

	push	19					; 00000013H
	call	?DebugClrScr@@YAXE@Z			; DebugClrScr

; 49   : 	DebugGotoXY (0,0);

	push	0
	push	0
	call	?DebugGotoXY@@YAXII@Z			; DebugGotoXY

; 50   : 	DebugSetColor (0x17);

	push	23					; 00000017H
	call	?DebugSetColor@@YAII@Z			; DebugSetColor

; 51   : 
; 52   : 	//! render text and logo
; 53   : 	DebugPuts (logo);

	mov	eax, DWORD PTR ?logo@@3PADA		; logo
	push	eax
	call	?DebugPuts@@YAXPAD@Z			; DebugPuts

; 54   : 	DebugSetColor (0x17);

	push	23					; 00000017H
	call	?DebugSetColor@@YAII@Z			; DebugSetColor

; 55   : 	DebugPuts ("PIC, PIT, and exception handlers are installed!\n\n");

	push	OFFSET $SG2727
	call	?DebugPuts@@YAXPAD@Z			; DebugPuts

; 56   : 	DebugPuts ("Hitting any key will fire the default HAL handlers as currently\n");

	push	OFFSET $SG2728
	call	?DebugPuts@@YAXPAD@Z			; DebugPuts

; 57   : 	DebugPuts ("no keyboard driver is installed.\n\n");

	push	OFFSET $SG2729
	call	?DebugPuts@@YAXPAD@Z			; DebugPuts

; 58   : 	DebugPrintf ("Your cpu vender: %s \n\n", get_cpu_vender ());

	call	?get_cpu_vender@@YAPBDXZ		; get_cpu_vender
	push	eax
	push	OFFSET $SG2730
	call	?DebugPrintf@@YAHPBDZZ			; DebugPrintf
	add	esp, 60					; 0000003cH
$LL2@main:

; 59   : 
; 60   : 	// Go into a loop--constantly display the current tick count
; 61   : 	for(;;) {
; 62   : 		DebugGotoXY (0,14);

	push	14					; 0000000eH
	push	0
	call	?DebugGotoXY@@YAXII@Z			; DebugGotoXY

; 63   : 		DebugPrintf ("Current tick count: %i", get_tick_count());

	call	?get_tick_count@@YAHXZ			; get_tick_count
	push	eax
	push	OFFSET $SG2734
	call	?DebugPrintf@@YAHPBDZZ			; DebugPrintf
	add	esp, 16					; 00000010H

; 64   : 	}

	jmp	SHORT $LL2@main
_main	ENDP
_TEXT	ENDS
END
