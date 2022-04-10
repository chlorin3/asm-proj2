;   PROGRAM  "szosty.asm"

dane SEGMENT 	;segment danych
Buf db 10 dup(0),'$'
dane ENDS

rozkazy SEGMENT 'CODE' use16 	;segment zawierający rozkazy programu
		ASSUME cs:rozkazy, ds:dane
wystartuj:	
		mov ax, SEG dane 
		mov ds, ax 
		
		mov si,9
		mov bx,10
		mov ax,0
		mov ax,1101101111011010b
przeksztalcenie:
		xor dx,dx 		
		div bx
		add dl,30H 		;zamiana reszty z dzielenia na kod ASCII

		mov Buf [si],dl 	;zapisanie cyfry w kodzie ASCII
		dec si 			;dekrementacja indeksu
		cmp ax,0 		;porownanie czy iloraz rowny zero
		jne przeksztalcenie 	;skok jesli wartosc niezerowea 
		
		mov dx, offset Buf
 		mov ah, 09h 
 		int 21h 
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