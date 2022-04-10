;   PROGRAM  "piaty.asm"

dane SEGMENT 	;segment danych
Buf db 5 dup(0),'$'
dane ENDS

rozkazy SEGMENT 'CODE' use16 	;segment zawierający rozkazy programu
		ASSUME cs:rozkazy, ds:dane
wystartuj:	
		mov ax, SEG dane
		mov ds, ax
		mov bx, OFFSET Buf 	;wpisanie do rejestru BX obszaru
					;zawierającego wyswietlany tekst
		
					; wczytywanie liczby do AX, zakończenie wczytywania po Enter 
		mov si, 0 		;początkowa wartość wyniku konwersji w SI 
p1: 		mov ah, 1 		;wczytanie znaku w kodzie ASCII 
		int 21H 		;z klawiatury do AL 
		cmp al, 13 
		je nacis_enter 		;skok gdy naciśnięto klawisz Enter 
		sub al, 30H 		;zamaiana kodu ASCII na wartość cyfry 
		mov bl, al 		;przechowanie kolejnej cyfry w AL 
		mov bh, 0 		;zerowanie rejestru BH 
		mov ax, 10 		;mnożnik 
		mul si 			;mnożenie dotychczas uzyskanego wyniku przez 
					;10 iloczyn zostaje wpisany do rejestrów DX:AX 
		add ax, bx 		;dodanie aktualnie wczytanej cyfry 
		mov si, ax 		;przesłanie wyniku obliczenia do rejestru SI 
		jmp p1 			
nacis_enter: 
		mov ax, si 	;przepisanie wyniku konwersji do rejestru AX

		mov al, 0 	;kod powrotu programu (przekazywany przez
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