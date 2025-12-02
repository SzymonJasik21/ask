
.model tiny
.stack 100h
.data
	tekst db "Programowanie w asemblerze$"
	;Dlaczego na końcu zmiennej "tekst" jest znak dolara "$"?
    ;Co wyświetliłoby się na ekranie, gdyby nie było na końcu zmiennej znaku dolara?


	licznik db 5
	;Dlaczego wartość zmiennej to 5 a nie "5" lub "5$"?

	komunikat1 db "Zmienna tekstowa to: $"

	komunikat2 db 13, 10, "Licznik to: $"
	;Dlaczego na początku wartości zmiennej są liczby 13 i 10?
	;Sprawdź w Internecie co to sa kody CR (Carriage Return) i LF (Line feed)
	
	komunikat3 db 0Dh, 0Ah, "Znak numer $"
	;Dlaczego na początku wartości zmiennej są liczby 0Dh i 0Ah?
	;Czy te liczby mogą mieć postać Dh i Ah? Jeżeli nie, to dlaczego?

	komunikat4 db " to: $"


.code

	;wyświetlenie komunikatu1
	mov bx, seg komunikat1
	mov ds, bx
	mov dx, offset komunikat1
	mov ah, 9
	int 21h

	;wyświetlenie zmiennej "tekst"
	mov bx, seg tekst
	mov ds, bx
	mov dx, offset tekst

	;TUTAJ CZEGOŚ BRAKUJE! UZUPEŁNIJ!
	

	;wyświetlenie komunikatu2
	mov bx, seg komunikat2
	mov ds, bx
	mov dx, offset komunikat2
	mov ah, 9
	int 21h

	;wyświetlenie zmiennej "licznik"
	mov bx, seg licznik
	mov ds, bx
	mov bx, offset licznik
	mov dl, ds:[bx]
	;Dlaczego mamy rejestr bx przy zapisie ds:[bx]?
	;Czy mógłby to być inny rejestr ogólnego przeznaczenia? Sprawdź
	;to w konspekcie do wykładu.
	;Jeżeli nie, to dlaczego?

	add dl, 48
	;Dlaczego dodajemy do wartości zmiennej "licznik" liczbę 48?
	;Obejrzyj tabele kodów ASCII i zastanów się nad tym, jak się
	;ma wartość liczby (np. 5) do kodu ASCII, który symbolizuje
	;cyfrę "5", czyli 5 -> "5"

	mov ah, 2
	int 21h


	;wyświetlenie komunikatu3
	mov bx, seg komunikat3
	mov ds, bx
	mov dx, offset komunikat3
	mov ah, 9
	int 21h

	;TUTAJ CZEGOŚ BRAKUJE! UZUPEŁNIJ!

	;wyświetlenie komunikatu4
	mov bx, seg komunikat4
	mov ds, bx
	mov dx, offset komunikat4
	mov ah, 9
	int 21h

	
	;wyświetlenie ze zmiennej "tekst" znaku o indeksie "licznik"
	mov bx, seg licznik
	mov ds, bx
	
	mov cx, 0
	;Dlaczego zerujemy rejestr CX?

	mov cl, ds:[offset licznik]
	;Tutaj zapisujemy do rejestru CL wartość licznika.
	;Dlaczego do rejestru CL a nie do rejestru CX?
	;Jak ma się wielkość (liczba bitów) zmiennej "licznik" do
	;liczby bitów rejestru CL (i CX)?
	;Z jakich rejestrów 8-bitowych składa się rejestr CX?
	
	mov bx, seg tekst
	mov ds, bx
	
	mov bx, offset tekst
	add bx, cx
	;W rejestrze BX jest teraz offset zmiennej "tekst", dlaczego
	;dodajemy do BX zawartość rejestru CX?

	sub bx, 1
	;Dlaczego odejmujemy od BX wartość 1?

	mov dl, ds:[bx]
	;Na jaką komórkę pamięci wskazuje teraz adres DS:[BX]?
		
	mov ah, 2
	int 21h

	
	;koniec programu
	mov ah, 4ch
	int 21h

end
