dane SEGMENT 	;segment danych 
tekst 		db 13,10,'zadanie trzecie', 13,10,'$'
linia		db 13,10,'$'
Buf1 		db 5 dup(0),'$'
Buf2 		db 10 dup(0),'$'
tablica db 'AABBCCDDEEFFGGHHIIJJKKLLMMNNOOPPQQRRSSTTUUVVWWXXYYZZAABBCCD$'
dane ENDS

rozkazy SEGMENT 'CODE' use16 ;segment zawierający rozkazy programu
	ASSUME cs:rozkazy, ds:dane
wystartuj:
		mov ax, SEG dane 
 		mov ds, ax

		call pierwszy

		mov dl,al
		call drugi

		mov dx, offset tekst
		call trzeci	;wypisanie zawartosci rejestru dx
		call szosty	;binarna -> dziesietna
		call trzeci	;wypisanie zawartosci rejestru dx
		
		mov dx, offset linia	;zrobienie odstepu
		call trzeci		;miedzy kolejny zadaniami

		call siodmy	;zamiana co 9 litery na mala
		call czwarty	;koniec programu

;podprogramy
pierwszy PROC near
		mov ah,07h 	;wczytaj znak z klawiatury bez wyswietlania
		int 21h 	;przerwanie
		ret
pierwszy ENDP

drugi PROC near
		mov ah,02h	;wyswietlenie znaku
		int 21h 
		ret
drugi ENDP

trzeci PROC near
		mov ah, 09h	;wyswietlenie lancucha znakow
		int 21h
		ret
trzeci ENDP

czwarty PROC near
		mov ah, 4CH 	;zakończenie programu – przekazanie sterowania
				;do systemu, za pomocą funkcji 4CH DOS
		int 21H
		ret
czwarty ENDP

piaty PROC near
		mov bx, OFFSET Buf1 	;wpisanie do rejestru BX obszaru
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
		mov ax, si 		;przepisanie wyniku konwersji do rejestru AX
		ret
piaty ENDP

szosty PROC near
		mov si,9
		mov bx,10
		mov ax,0
		mov ax,1101101111011010b
przeksztalcenie:
		xor dx,dx 		
		div bx
		add dl,30H 		;reszta z dzielenia na kod ASCIi

		mov Buf2 [si],dl 	;zapisanie cyfry w kodzie ASCII
		dec si 			;dekrementacja indeksu
		cmp ax,0 		;porownanie czy iloraz rowny zero
		jne przeksztalcenie 	;skok jesli wartosc niezerowea 
		
		mov dx, offset Buf2
		ret
szosty ENDP

siodmy PROC near
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
		call drugi		;wyświetlenie znaku za pomocą funkcji nr 2 DOS
		inc bx			;inkrementacja adresu kolejnego znaku
loop ptl 				;sterowanie pętlą

mala:		
		add dl,32		;zwiekszenie kodu ASCII o 32, taka jest roznica miedzy
					;duza i mala litera
		mov si,9		;licznik znowu rowny 9
		jmp wypisz		;skok bezwarunkowy do wypisania znaku

koniec:
		ret
siodmy ENDP

rozkazy ENDS
END wystartuj 