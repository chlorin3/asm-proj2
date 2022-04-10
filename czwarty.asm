;   PROGRAM  "czwarty.asm"

dane SEGMENT 	;segment danych
dane ENDS

rozkazy SEGMENT 'CODE' use16 	;segment zawierający rozkazy programu
		ASSUME cs:rozkazy, ds:dane
wystartuj:

		mov ah, 4CH 	;zakończenie programu – przekazanie sterowania
				;do systemu, za pomocą funkcji 4CH DOS
		int 21H
rozkazy ENDS

nasz_stos SEGMENT stack 	;segment stosu
dw 128 dup (?)
nasz_stos ENDS

END wystartuj 			;wykonanie programu zacznie się od rozkazu
				;opatrzonego etykietą wystartuj