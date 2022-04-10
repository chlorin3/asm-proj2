; PROGRAM "pierwszy.asm"
dane SEGMENT ;segment danych
dane ENDS
rozkazy SEGMENT 'CODE' use16 ;segment zawierający rozkazy programu
	ASSUME cs:rozkazy, ds:dane
wystartuj:
		xor al,al 	;zerowanie rejestru
		mov ah,07h 	;wczytaj znak z klawiatury bez wyswietlania
		int 21h 	;przerwanie

		mov ah, 4CH 	;zakończenie programu – przekazanie sterowania
				;do systemu, za pomocą funkcji 4CH DOS
		int 21H 
rozkazy ENDS
END wystartuj 			;wykonanie programu zacznie się od rozkazu
				;opatrzonego etykietą wystartuj