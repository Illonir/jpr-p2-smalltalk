Object subclass: #Wielokat
	instanceVariableNames: 'wierzcholki nazwa '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!

!Wielokat methodsFor: 'initialize-release'!

initialize: liczbaWierzcholkow name: nowaNazwa
	"konstruktor obiektu - wielokata"

	nazwa:=nowaNazwa.
	wierzcholki:=Array new: liczbaWierzcholkow.
	wierzcholki at: 1 put: 0@0.! !

!Wielokat methodsFor: 'accessing'!

nazwa
	"podaje nazwe wielokata"

	^nazwa!

nazwa: nowa_nazwa
	"ustawia nowa nazwe wielokata"

	nazwa:=nowa_nazwa! !
	
!Wielokat methodsFor: 'actions'!

pole	"NOWE"
	"wymagane przez instrukcje"
	"implementacja zalezy do klasy potomnej"

    ^0!

drukuj	"NOWE"
	"wyswietla parametry wielokata"
	"pewnie da sie zrobic ladniej"

	Transcript show: 'Pole: '.
    Transcript show: (self pole) printString; cr.
	Transcript show: 'wierzcholki wielokata:'; cr.
    1 to: (wierzcholki size) do: [ :i |
        Transcript show: (wierzcholki at: i) printString; cr.
    ].! !


Wielokat subclass: #Kwadrat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Kwadrat methodsFor: 'arithmetic'!

+ figura
	"dodaj 2 figury w sensie pola"

	| p |

	p:=self pole + figura pole.
	^(Kwadrat new) initialize: p sqrt! !

!Kwadrat methodsFor: 'actions'!

pole
	"licz pole kwadratu"

	^(wierzcholki at: 2) x squared! !

!Kwadrat methodsFor: 'initialize-release'!

initialize: bok
	"tworz kwadrat o podanym boku"

	super initialize: 4 name: 'Kwadrat'.
	wierzcholki at: 2 put: bok@0.
	wierzcholki at: 3 put: bok@bok.
	wierzcholki at: 4 put: 0@bok.! !
	

"Szesciokat"	"NOWE"
Wielokat subclass: #Heks
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Heks methodsFor: 'arithmetic'!

+ figura
	"tworzy nowy heks o polu rownym sumie pol dodawanych figur"
	"nowy heks w standardowej pozycji - wierzcholki at: 1 = 0@0"
	"wzor: bok = sqrt([2*Pole]/[3*sqrt(3)])"

	| nowyBok |
	nowyBok:= ((2*(self pole + figura pole))/(3*(3 sqrt))).
	^(Heks new) initialize: nowyBok sqrt! !

!Heks methodsFor: 'actions'!

pole
	"licz pole szesciokata"
	"wzor: Pole = 3*sqrt(3)*bok^2/2"

	| bok |
	bok := (((wierzcholki at: 4) - (wierzcholki at: 1)) x)/2.
	^(((bok squared)*(3*(3 sqrt)))/2)! !

!Heks methodsFor: 'initialize-release'!

initialize: bok
	"tworz szesciokat o podanym boku"
	"wierzcholek 1 to 0@0"
	"	  2--3  	"
	"	 /    \ 	"
	"	1      4	"
	"	 \    / 	"
	"	  6--5  	"

    | kat |
	kat := (Float pi)/3.	"kat w radianach"

	super initialize: 6 name: 'Heks'.
    	wierzcholki at: 2 put: (((wierzcholki at: 1) x) + (bok *(kat cos)))@(((wierzcholki at: 1) y) + (bok * (kat sin))).
	wierzcholki at: 3 put: (((wierzcholki at: 1) x) + ((bok * (kat cos)) + bok))@(((wierzcholki at: 1) y) + (bok * (kat sin))).
	wierzcholki at: 4 put: (((wierzcholki at: 1) x) + (2 * bok))@((wierzcholki at: 1) y).
	wierzcholki at: 5 put: (((wierzcholki at: 1) x) + ((bok * (kat cos)) + bok))@(((wierzcholki at: 1) y) + (-1 * bok* (kat sin))).
	wierzcholki at: 6 put: (((wierzcholki at: 1) x) + (bok * (kat cos)))@(((wierzcholki at: 1) y) + (-1 * bok * (kat sin))).! !
	
	

"Testy"
Transcript cr.
Transcript show: 'Utworzenie heksa o boku 1 i wypisanie jego pola'; cr.
h1 := (Heks new) initialize: 1.
Transcript show: 'Pole h1: '.
Transcript show: (h1 pole) printString; cr.

Transcript cr.
Transcript show: 'Wydrukowanie heksa o boku 1'; cr.
h1 drukuj.

Transcript cr.
Transcript show: 'Utworzenie i wydrukowanie heksa o boku 2'; cr.
h2 := (Heks new) initialize: 2.
h2 drukuj.

Transcript cr.
Transcript show: 'Suma pol h1 i h2: '.
A := (h1 pole) + (h2 pole). 
Transcript show: A printString; cr.

Transcript cr.
Transcript show: 'Dodanie h1 do h2'; cr.
h12 := h1 + h2.
Transcript show: 'Pole h1 + h2: '.
Transcript show: (h12 pole) printString; cr.

Transcript cr.
Transcript show: 'Dodanie h2 do h1'; cr.
h21 := h2 + h1.
Transcript show: 'Pole h2 + h1: '.
Transcript show: (h21 pole) printString; cr.
