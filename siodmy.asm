;   PROGRAM  "siodmy.asm"

dane SEGMENT 	;segment danych
tablica db 'AABBCCDDEEFFGGHHIIJJKKLLMMNNOOPPQQRRSSTTUUVVWWXXYYZZAABBCCD$'
dane ENDS

rozkazy SEGMENT 'CODE' use16 	;segment zawierający rozkazy programu
		ASSUME cs:rozkazy, ds:dane
wystartuj:
		mov ax, SEG dane 
		mov ds, ax 
		
		mov si, 9 		;licznik dla co 9 litery
		mov bx, OFFSET tablica 	;wpisanie do rejestru BX obszaru
					;zawierającego wyswietlany tekst

ptl:
		mov dl, [bx]		;wpisanie zawartosci  bx do dl
		cmp dl,'$'		;sprawdzenie czy koniec tablicy
		je koniec		;jesli tak, to skok do konca programu

		dec si			;zmniejszenie licznika
		cmp si,0		;sprawdzenie czy licznik rowny 0
		je mala			;jesli rowny to skok do 'mala' gdzie zmieniamy litere na mala
wypisz:
		mov ah, 2
		int 21H 		;wyświetlenie znaku za pomocą funkcji nr 2 DOS
		inc bx			;inkrementacja adresu kolejnego znaku
loop ptl 				;sterowanie pętlą

mala:		
		add dl,32		;zwiekszenie kodu ASCII o 32, taka jest roznica miedzy
					;duza i mala litera
		mov si,9		;licznik znowu rowny 9
		jmp wypisz		;skok bezwarunkowy do wypisania znaku

koniec:
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