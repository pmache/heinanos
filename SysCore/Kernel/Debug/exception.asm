; Listing generated by Microsoft (R) Optimizing Compiler Version 14.00.50727.42 

	TITLE	c:\Documents and Settings\Michael\Desktop\bte_lighter\Demos\Demo_8_new\SysCore\Kernel\exception.cpp
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB LIBCMT
INCLUDELIB OLDNAMES

CONST	SEGMENT
$SG2680	DB	'Divide by 0', 00H
$SG2689	DB	'Single step', 00H
$SG2698	DB	'NMI trap', 00H
	ORG $+3
$SG2707	DB	'Breakpoint trap', 00H
$SG2716	DB	'Overflow trap', 00H
	ORG $+2
$SG2725	DB	'Bounds check fault', 00H
	ORG $+1
$SG2734	DB	'Invalid opcode', 00H
	ORG $+1
$SG2743	DB	'Device not found', 00H
	ORG $+3
$SG2753	DB	'Double fault', 00H
	ORG $+3
$SG2763	DB	'Invalid TSS', 00H
$SG2773	DB	'Invalid segment', 00H
$SG2783	DB	'Stack fault', 00H
$SG2793	DB	'General Protection Fault', 00H
	ORG $+3
$SG2803	DB	'Page Fault', 00H
	ORG $+1
$SG2812	DB	'FPU Fault', 00H
	ORG $+2
$SG2822	DB	'Alignment Check', 00H
$SG2831	DB	'Machine Check', 00H
	ORG $+2
$SG2840	DB	'FPU SIMD fault', 00H
CONST	ENDS
PUBLIC	?divide_by_zero_fault@@YAXIII@Z			; divide_by_zero_fault
EXTRN	?kernel_panic@@YAXPBDZZ:PROC			; kernel_panic
; Function compile flags: /Ogtpy
; File c:\documents and settings\michael\desktop\bte_lighter\demos\demo_8_new\syscore\kernel\exception.cpp
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_eip$ = 12						; size = 4
_eflags$ = 16						; size = 4
?divide_by_zero_fault@@YAXIII@Z PROC			; divide_by_zero_fault

; 22   : 
; 23   : //	intstart ();
; 24   : 	kernel_panic ("Divide by 0");

	push	OFFSET $SG2680
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@divide_by_:

; 25   : 	for (;;);

	jmp	SHORT $LL2@divide_by_
?divide_by_zero_fault@@YAXIII@Z ENDP			; divide_by_zero_fault
_TEXT	ENDS
PUBLIC	?single_step_trap@@YAXIII@Z			; single_step_trap
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_eip$ = 12						; size = 4
_eflags$ = 16						; size = 4
?single_step_trap@@YAXIII@Z PROC			; single_step_trap

; 30   : 
; 31   : //	intstart ();
; 32   : 	kernel_panic ("Single step");

	push	OFFSET $SG2689
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@single_ste:

; 33   : 	for (;;);

	jmp	SHORT $LL2@single_ste
?single_step_trap@@YAXIII@Z ENDP			; single_step_trap
_TEXT	ENDS
PUBLIC	?nmi_trap@@YAXIII@Z				; nmi_trap
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_eip$ = 12						; size = 4
_eflags$ = 16						; size = 4
?nmi_trap@@YAXIII@Z PROC				; nmi_trap

; 38   : 
; 39   : //	intstart ();
; 40   : 	kernel_panic ("NMI trap");

	push	OFFSET $SG2698
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@nmi_trap:

; 41   : 	for (;;);

	jmp	SHORT $LL2@nmi_trap
?nmi_trap@@YAXIII@Z ENDP				; nmi_trap
_TEXT	ENDS
PUBLIC	?breakpoint_trap@@YAXIII@Z			; breakpoint_trap
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_eip$ = 12						; size = 4
_eflags$ = 16						; size = 4
?breakpoint_trap@@YAXIII@Z PROC				; breakpoint_trap

; 46   : 
; 47   : //	intstart ();
; 48   : 	kernel_panic ("Breakpoint trap");

	push	OFFSET $SG2707
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@breakpoint:

; 49   : 	for (;;);

	jmp	SHORT $LL2@breakpoint
?breakpoint_trap@@YAXIII@Z ENDP				; breakpoint_trap
_TEXT	ENDS
PUBLIC	?overflow_trap@@YAXIII@Z			; overflow_trap
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_eip$ = 12						; size = 4
_eflags$ = 16						; size = 4
?overflow_trap@@YAXIII@Z PROC				; overflow_trap

; 54   : 
; 55   : //	intstart ();
; 56   : 	kernel_panic ("Overflow trap");

	push	OFFSET $SG2716
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@overflow_t:

; 57   : 	for (;;);

	jmp	SHORT $LL2@overflow_t
?overflow_trap@@YAXIII@Z ENDP				; overflow_trap
_TEXT	ENDS
PUBLIC	?bounds_check_fault@@YAXIII@Z			; bounds_check_fault
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_eip$ = 12						; size = 4
_eflags$ = 16						; size = 4
?bounds_check_fault@@YAXIII@Z PROC			; bounds_check_fault

; 62   : 
; 63   : //	intstart ();
; 64   : 	kernel_panic ("Bounds check fault");

	push	OFFSET $SG2725
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@bounds_che:

; 65   : 	for (;;);

	jmp	SHORT $LL2@bounds_che
?bounds_check_fault@@YAXIII@Z ENDP			; bounds_check_fault
_TEXT	ENDS
PUBLIC	?invalid_opcode_fault@@YAXIII@Z			; invalid_opcode_fault
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_eip$ = 12						; size = 4
_eflags$ = 16						; size = 4
?invalid_opcode_fault@@YAXIII@Z PROC			; invalid_opcode_fault

; 70   : 
; 71   : //	intstart ();
; 72   : 	kernel_panic ("Invalid opcode");

	push	OFFSET $SG2734
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@invalid_op:

; 73   : 	for (;;);

	jmp	SHORT $LL2@invalid_op
?invalid_opcode_fault@@YAXIII@Z ENDP			; invalid_opcode_fault
_TEXT	ENDS
PUBLIC	?no_device_fault@@YAXIII@Z			; no_device_fault
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_eip$ = 12						; size = 4
_eflags$ = 16						; size = 4
?no_device_fault@@YAXIII@Z PROC				; no_device_fault

; 78   : 
; 79   : //	intstart ();
; 80   : 	kernel_panic ("Device not found");

	push	OFFSET $SG2743
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@no_device_:

; 81   : 	for (;;);

	jmp	SHORT $LL2@no_device_
?no_device_fault@@YAXIII@Z ENDP				; no_device_fault
_TEXT	ENDS
PUBLIC	?double_fault_abort@@YAXIIII@Z			; double_fault_abort
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_err$ = 12						; size = 4
_eip$ = 16						; size = 4
_eflags$ = 20						; size = 4
?double_fault_abort@@YAXIIII@Z PROC			; double_fault_abort

; 86   : 
; 87   : //	intstart ();
; 88   : 	kernel_panic ("Double fault");

	push	OFFSET $SG2753
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@double_fau:

; 89   : 	for (;;);

	jmp	SHORT $LL2@double_fau
?double_fault_abort@@YAXIIII@Z ENDP			; double_fault_abort
_TEXT	ENDS
PUBLIC	?invalid_tss_fault@@YAXIIII@Z			; invalid_tss_fault
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_err$ = 12						; size = 4
_eip$ = 16						; size = 4
_eflags$ = 20						; size = 4
?invalid_tss_fault@@YAXIIII@Z PROC			; invalid_tss_fault

; 94   : 
; 95   : //	intstart ();
; 96   : 	kernel_panic ("Invalid TSS");

	push	OFFSET $SG2763
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@invalid_ts:

; 97   : 	for (;;);

	jmp	SHORT $LL2@invalid_ts
?invalid_tss_fault@@YAXIIII@Z ENDP			; invalid_tss_fault
_TEXT	ENDS
PUBLIC	?no_segment_fault@@YAXIIII@Z			; no_segment_fault
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_err$ = 12						; size = 4
_eip$ = 16						; size = 4
_eflags$ = 20						; size = 4
?no_segment_fault@@YAXIIII@Z PROC			; no_segment_fault

; 102  : 
; 103  : //	intstart ();
; 104  : 	kernel_panic ("Invalid segment");

	push	OFFSET $SG2773
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@no_segment:

; 105  : 	for (;;);

	jmp	SHORT $LL2@no_segment
?no_segment_fault@@YAXIIII@Z ENDP			; no_segment_fault
_TEXT	ENDS
PUBLIC	?stack_fault@@YAXIIII@Z				; stack_fault
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_err$ = 12						; size = 4
_eip$ = 16						; size = 4
_eflags$ = 20						; size = 4
?stack_fault@@YAXIIII@Z PROC				; stack_fault

; 110  : 
; 111  : //	intstart ();
; 112  : 	kernel_panic ("Stack fault");

	push	OFFSET $SG2783
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@stack_faul:

; 113  : 	for (;;);

	jmp	SHORT $LL2@stack_faul
?stack_fault@@YAXIIII@Z ENDP				; stack_fault
_TEXT	ENDS
PUBLIC	?general_protection_fault@@YAXIIII@Z		; general_protection_fault
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_err$ = 12						; size = 4
_eip$ = 16						; size = 4
_eflags$ = 20						; size = 4
?general_protection_fault@@YAXIIII@Z PROC		; general_protection_fault

; 118  : 
; 119  : //	intstart ();
; 120  : 	kernel_panic ("General Protection Fault");

	push	OFFSET $SG2793
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@general_pr:

; 121  : 	for (;;);

	jmp	SHORT $LL2@general_pr
?general_protection_fault@@YAXIIII@Z ENDP		; general_protection_fault
_TEXT	ENDS
PUBLIC	?page_fault@@YAXIIII@Z				; page_fault
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_err$ = 12						; size = 4
_eip$ = 16						; size = 4
_eflags$ = 20						; size = 4
?page_fault@@YAXIIII@Z PROC				; page_fault

; 126  : 
; 127  : //	intstart ();
; 128  : 	kernel_panic ("Page Fault");

	push	OFFSET $SG2803
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@page_fault:

; 129  : 	for (;;);

	jmp	SHORT $LL2@page_fault
?page_fault@@YAXIIII@Z ENDP				; page_fault
_TEXT	ENDS
PUBLIC	?fpu_fault@@YAXIII@Z				; fpu_fault
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_eip$ = 12						; size = 4
_eflags$ = 16						; size = 4
?fpu_fault@@YAXIII@Z PROC				; fpu_fault

; 134  : 
; 135  : //	intstart ();
; 136  : 	kernel_panic ("FPU Fault");

	push	OFFSET $SG2812
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@fpu_fault:

; 137  : 	for (;;);

	jmp	SHORT $LL2@fpu_fault
?fpu_fault@@YAXIII@Z ENDP				; fpu_fault
_TEXT	ENDS
PUBLIC	?alignment_check_fault@@YAXIIII@Z		; alignment_check_fault
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_err$ = 12						; size = 4
_eip$ = 16						; size = 4
_eflags$ = 20						; size = 4
?alignment_check_fault@@YAXIIII@Z PROC			; alignment_check_fault

; 142  : 
; 143  : //	intstart ();
; 144  : 	kernel_panic ("Alignment Check");

	push	OFFSET $SG2822
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@alignment_:

; 145  : 	for (;;);

	jmp	SHORT $LL2@alignment_
?alignment_check_fault@@YAXIIII@Z ENDP			; alignment_check_fault
_TEXT	ENDS
PUBLIC	?machine_check_abort@@YAXIII@Z			; machine_check_abort
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_eip$ = 12						; size = 4
_eflags$ = 16						; size = 4
?machine_check_abort@@YAXIII@Z PROC			; machine_check_abort

; 150  : 
; 151  : //	intstart ();
; 152  : 	kernel_panic ("Machine Check");

	push	OFFSET $SG2831
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@machine_ch:

; 153  : 	for (;;);

	jmp	SHORT $LL2@machine_ch
?machine_check_abort@@YAXIII@Z ENDP			; machine_check_abort
_TEXT	ENDS
PUBLIC	?simd_fpu_fault@@YAXIII@Z			; simd_fpu_fault
; Function compile flags: /Ogtpy
_TEXT	SEGMENT
_cs$ = 8						; size = 4
_eip$ = 12						; size = 4
_eflags$ = 16						; size = 4
?simd_fpu_fault@@YAXIII@Z PROC				; simd_fpu_fault

; 158  : 
; 159  : //	intstart ();
; 160  : 	kernel_panic ("FPU SIMD fault");

	push	OFFSET $SG2840
	call	?kernel_panic@@YAXPBDZZ			; kernel_panic
	add	esp, 4
	npad	3
$LL2@simd_fpu_f:

; 161  : 	for (;;);

	jmp	SHORT $LL2@simd_fpu_f
?simd_fpu_fault@@YAXIII@Z ENDP				; simd_fpu_fault
_TEXT	ENDS
END
