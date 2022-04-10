# asm-proj2
My assembly language mini-projects part 2 (university assignments)
### 1. pierwszy.asm
Napisz podprogram wczytujący jeden znak z klawiatury. Daną wyjściową (znak) odczytaj z rejestru al
 (wykorzystaj odpowiednią funkcję przerwania 21h DOS).
### 2. drugi.asm
Napisz podprogram wyświetlający jeden znak na ekranie. Daną wejściową (znak) przekaż poprzez rejestr dl
 (wykorzystaj odpowiednią funkcję przerwania 21h DOS). 
### 3. trzeci.asm
Napisz podprogram wyświetlający ciąg znaków (tablicę znakową) na ekranie. Daną wejściową - offset tablicy znakowej – przekaż przez rejestr dx (wykorzystaj odpowiednią funkcję 
 przerwania 21h DOS). 
### 4. czwarty.asm
Napisz podprogram wysyłający do systemu kod powrotu oraz rozkaz kończący cały program
 asemblerowy (wykorzystaj odpowiednią funkcję przerwania 21h DOS).
### 5. piaty.asm
Zdefiniuj zmienną
 Buf db 5 dup (0), '$'
 Napisz podprogram wczytujący do tablicy znakowej Buf maksymalnie 5 cyfr dodatniej liczby w kodzie 
 dziesiętnym (nie większej niż FFFFh) a następnie korzystając ze schematu Hornera (patrz instrukcja do ćw. 3
 punkt 3.3) zamieniający wczytaną liczbę na binarną. Otrzymaną liczbę zapisz w rejestrze ax.
### 6. szosty.asm
Napisz podprogram zamieniający dodatnią liczbę16 bitową na liczbę dziesiętną. Daną wejściową przekaż
 poprzez rejestr ax. Do przekształcenia liczby binarnej na dziesiętna wykorzystaj metodę dzielenia przez 
 podstawę systemu. Do zapamiętania cyfr liczby dziesiętnej wykorzystaj tablicę znakowa Buf.
### 7. siodmy.asm
Zdefiniuj tablicę 64 znakową wypełnioną w sposób przypadkowy wielkimi literami: 'A', …, 'Z',
 zakończoną znakiem "$".
 Napisz podprogram wyświetlający tablicę przekształconą w taki sposób, że co dziewiąty znak tablicy
 zamieniono na małą literę. 
### 8. osmy.asm
Napisz program asemblerowy wykorzystujący wszystkie zrealizowane podprogramy.
Uwaga: jeśli to konieczne zdefiniuj dodatkowe zmienne i tablice.
