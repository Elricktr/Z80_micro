;Read your name and seach for
;a given letter position

;---------------------
;main program
;---------------------
	.org 0000h
	;define stack
	ld sp,27ffh
	;port initialization
	ld a,89h
	out (CW),a
	ld hl,text1
	call disp_text
	call read_name
	halt

;---------------------
;routines
;---------------------
disp_text:
	ld a,(hl)
	cp '&'
	jp Z,end1
	out (LCD),a
	inc hl
	jp disp_text
end1:
	ret

read_name:
	ld hl,name
another1:
	in a,(KEYB)
	cp 0Dh
	jp z,end2
	ld (hl),a
	inc hl
	jp another1
end2:
	ret

;---------------------
;data
;---------------------
	.org 2000h
text1	.db "NOMBRE: &"
name	.db "               "
LCD	.equ 01h
KEYB	.equ 02h
CW	.equ 03h
;---------------------
;end of program
;---------------------
	.end