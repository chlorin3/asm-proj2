;   PROGRAM  "trzeci.asm"

dane SEGMENT 	;segment danych
tekst 	db 'zadanie trzecie', 13,10,'$'
dane ENDS

rozkazy SEGMENT 'CODE' use16 	;segment zawierający rozkazy programu
		ASSUME cs:rozkazy, ds:dane
wystartuj:
		mov ax, SEG dane
		mov ds, ax
		mov dx, offset tekst
		mov ah, 09h	;wyswietl lancuch tekstowy
		int 21h

		mov al, 0	;kod powrotu programu (przekazywany przez
				;rejestr AL) stanowi syntetyczny opis programu
				;przekazywany do systemu operacyjnego
				;(zazwyczaj kod 0 oznacza, że program został
				;wykonany poprawnie)
		mov ah, 4CH 	;zakończenie programu – przekazanie sterowania
				;do systemu, za pomocą funkcji 4CH DOS
		int 21H
rozkazy ENDS

nasz_stos SEGMENT stack 	;segment stosu
dw 128 dup (?)
nasz_stos ENDS

END wystartuj 			;wykonanie programu zacznie się od rozkazu
				;opatrzonego etykietą wystartuj