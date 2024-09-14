;Considerando que el sistema solo tiene memoria EEPROM
;calcule la raíz cuadrada de un número entero, sin signo, de 8 bits.
;El número, del que se obtendrá su raíz cuadrada debe ser dado en BCD (decimal), en el registro B
;de tal manera que podremos obtener la raíz cuadrada de números en el rango de 0 a 99
;EL resultado (solo la parte entera), debe ser depositado (en decimal) en el registro C
.org 0000h
;cargando las ondiciones inicailes
	ld b,99
	ld a,b
	ld h,9		;inicio de contador

;busqueda de raizes
	cp 81		;raizes enteras
	jp p, resultado ;mayor o menor que
	jp z, resultado ;
	dec h    ;contador
	cp 64
	jp p, resultado
	jp z, resultado
	dec h
	cp 49
	jp p, resultado
	jp z, resultado
	dec h
	cp 36
	jp p, resultado
	jp z, resultado
	dec h
	cp 25
	jp p, resultado
	jp z, resultado
	dec h
	cp 16
	jp p, resultado
	jp z, resultado
	dec h
	cp 9
	jp p, resultado
	jp z, resultado
	dec h
	cp 4
	jp p, resultado
	jp z, resultado
	cp 0
	jr z,caso1
	cp 1
	jr z,caso
	cp 3
	jr z,caso
	jp p, resultado
	end
;fin de caso 0
caso1:
	ld c,a
	halt
;fin de casos 1 a 3
caso:
	ld c,1
	halt
	end
;fin de cason en general
resultado:
	ld c,h
	halt
	end
;Si dios existira no se me hubiera permitido escribir esto