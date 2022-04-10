;   PROGRAM  "drugi.asm"

dane SEGMENT 	;segment danych
dane ENDS

rozkazy SEGMENT 'CODE' use16 	;segment zawierający rozkazy programu
		ASSUME cs:rozkazy, ds:dane
wystartuj:
		mov dl, 25h ;wpisanie % do rejestru
		mov ah, 2; wyswietlenie znaku
		int 21h 

		mov ah, 4CH 	;zakończenie programu – przekazanie sterowania
				;do systemu, za pomocą funkcji 4CH DOS
		int 21H
rozkazy ENDS
END wystartuj 			;wykonanie programu zacznie się od rozkazu
				;opatrzonego etykietą wystartuj