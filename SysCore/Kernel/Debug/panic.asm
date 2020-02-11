; Listing generated by Microsoft (R) Optimizing Compiler Version 14.00.50727.42 

	TITLE	c:\Users\Heinan\Desktop\Demo8\Demo_8\SysCore\Kernel\panic.cpp
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

CONST	SEGMENT
$SG2620	DB	'HeinanOS has encountered a problem and has been shut dow'
	DB	'n', 0aH, 09H, 'to prevent damage to your computer. Any unsave'
	DB	'd work might be lost.', 0aH, 09H, 'We are sorry for the incon'
	DB	'venience this might have caused.', 0aH, 0aH, 09H, 'Please rep'
	DB	'ort the following information and restart your computer.', 0aH
	DB	09H, 'The system has been halted.', 0aH, 0aH, 00H
	ORG $+1
$SG2621	DB	'*** STOP: %s', 00H
CONST	ENDS
PUBLIC	?kernel_panic@@YAXPBDZZ				; kernel_panic
EXTRN	?DebugPrintf@@YAHPBDZZ:PROC			; DebugPrintf
EXTRN	?DebugPuts@@YAXPAD@Z:PROC			; DebugPuts
EXTRN	?DebugSetColor@@YAII@Z:PROC			; DebugSetColor
EXTRN	?DebugGotoXY@@YAXII@Z:PROC			; DebugGotoXY
EXTRN	?DebugClrScr@@YAXE@Z:PROC			; DebugClrScr
EXTRN	?disable@@YAXXZ:PROC				; disable
; Function compile flags: /Ogtpy
; File c:\users\heinan\desktop\demo8\demo_8\syscore\kernel\panic.cpp
_TEXT	SEGMENT
_fmt$ = 8						; size = 4
?kernel_panic@@YAXPBDZZ PROC				; kernel_panic

; 13   : 
; 14   : 	disable ();

	call	?disable@@YAXXZ				; disable

; 15   : 
; 16   : 	va_list		args;
; 17   : 	static char buf[1024];
; 18   : 
; 19   : 	va_start (args, fmt);
; 20   : 
; 21   : // We will need a vsprintf() here. I will see if I can write
; 22   : // one before the tutorial release
; 23   : 
; 24   : 	va_end (args);
; 25   : 
; 26   : 	char* disclamer="HeinanOS has encountered a problem and has been shut down\n\
; 27   : 	to prevent damage to your computer. Any unsaved work might be lost.\n\
; 28   : 	We are sorry for the inconvenience this might have caused.\n\n\
; 29   : 	Please report the following information and restart your computer.\n\
; 30   : 	The system has been halted.\n\n";
; 31   : 
; 32   : 	DebugClrScr (0x1f);

	push	31					; 0000001fH
	call	?DebugClrScr@@YAXE@Z			; DebugClrScr

; 33   : 	DebugGotoXY (0,0);

	push	0
	push	0
	call	?DebugGotoXY@@YAXII@Z			; DebugGotoXY

; 34   : 	DebugSetColor (0x1f);

	push	31					; 0000001fH
	call	?DebugSetColor@@YAII@Z			; DebugSetColor

; 35   : 	DebugPuts (disclamer);

	push	OFFSET $SG2620
	call	?DebugPuts@@YAXPAD@Z			; DebugPuts

; 36   : 
; 37   : 	DebugPrintf ("*** STOP: %s", fmt);

	mov	eax, DWORD PTR _fmt$[esp+16]
	push	eax
	push	OFFSET $SG2621
	call	?DebugPrintf@@YAHPBDZZ			; DebugPrintf
	add	esp, 28					; 0000001cH
$LL2@kernel_pan:

; 38   : 
; 39   : 	for (;;);

	jmp	SHORT $LL2@kernel_pan
?kernel_panic@@YAXPBDZZ ENDP				; kernel_panic
_TEXT	ENDS
END
