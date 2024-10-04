;Read your name and seach for
;a given letter position

;---------------------
;constant declaration
;---------------------
LCD	.equ 01h
CW	.equ 03h

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
	call Ran
	call numdisp
	ld hl,text2
	call disp_text
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
numdisp:
	ld a,(hl)
	cp '&'
	jp Z,end1
	out (LCD),a
	inc hl
	jp disp_text

Ran:
    ld b, 20
loop:
    ld a, seed     ; Semilla inicial
    ld e, a
    add a, a
    add a, a
    add a, e
    inc a
    ld (Ran+1),a
    ld a,data1
    dec b
    djnz loop
    ret

;---------------------
;data
;---------------------
data1	.db 000;,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000
data2	.db 000;,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000
data3	.db 000
data4	.db 000
data5	.db 000
data6	.db 000
data7	.db 000
data8	.db 000
data9	.db 000
data10	.db 000
data11	.db 000
data12	.db 000
data13	.db 000
data14	.db 000
data15	.db 000
data16	.db 000
data17	.db 000
data18	.db 000
data19	.db 000
data20	.db 000
seed .equ 10
text1	.db "Iniciar la generacion de numeros&"
text2   .db "Desea terminar o repetir el programa&"
;---------------------
;end of program
;---------------------
	.end