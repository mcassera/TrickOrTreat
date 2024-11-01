; music for trickortreat game

mTimer:	.byte $00							; counter against TOF for timing purposes
mFlag:	.byte $00							; when counter hits a certain number we've hit a 16th note
nCounter:
		.byte $00							; what note in the sequence have we hit\
n2Counter:
		.byte $00

;part A
partA:


.byte   RT,SK,SK,SK,	SK,SK,SK,SK,	C4,SK,SK,SK,    D4,SK,SK,SK                                                   ;INTRO
.BYTE   DS4,SK,SK,SK,   SK,SK,SK,SK,    RT,SK,SK,SK,    FS4,SK,SK,SK                   ;2
.BYTE   D4,SK,SK,SK,    SK,SK,SK,SK,    RT,SK,SK,SK,    AS4,SK,G4,SK
.BYTE   A4,SK,G4,SK,    F4,SK,SK,SK,    SK,SK,SK,SK,    SK,SK,SK,SK
.BYTE   A4,SK,SK,SK,    SK,SK,SK,SK,    SK,SK,SK,SK,    SK,SK,SK,SK                     ;5

.BYTE   SK,SK,SK,SK,    SK,SK,SK,SK,    SK,SK,SK,SK,    SK,SK,SK,SK
.BYTE   RT,SK,SK,SK,    A4,SK,RT,SK,    A4,SK,RT,SK,    A4,SK,AS4,SK
.BYTE   E5,SK,SK,SK,    SK,SK,SK,SK,    SK,SK,SK,SK,    RT,SK,D5,SK
.BYTE   CS5,SK,SK,SK,   SK,SK,SK,SK,    SK,SK,SK,SK,    RT,SK,F4,SK                     ;9

.BYTE   E5,SK,SK,SK,    SK,SK,SK,SK,    SK,SK,SK,SK,    RT,SK,SK,SK                     ;10
.BYTE   A4,SK,A4,SK,    A4,SK,A4,SK,    A4,AS4,G4,SK,   G4,SK,SK,SK
.BYTE   G4,SK,G4,SK,    G4,SK,G4,SK,    G4,A4,AS4,SK,   A4,SK,SK,SK                     ;12

;PAGE 2

.BYTE   A4,SK,SK,SK,    SK,SK,SK,SK,    C5,SK,SK,SK,    SK,SK,SK,SK
.BYTE   G5,SK,G5,SK,    G5,A5,AS5,SK,   A5,SK,F5,SK,    E5,SK,SK,SK
.BYTE   E5,SK,SK,SK,    A4,SK,SK,SK,    A5,SK,SK,SK,    E5,SK,SK,SK                     ;15

.BYTE   C6,SK,G5,SK,    G5,SK,F5,E5,    D5,SK,A5,SK,    AS5,SK,RT,SK
.BYTE   CS5,SK,C5,SK,   CS5,C5,AS4,SK,  CS5,CS5,CS5,CS5,    CS5,C5,AS4,SK
.BYTE   CS5,SK,A4,SK,   A4,SK,FS4,F4,   DS4,SK,SK,SK,   DS4,SK,RT,SK                    ;18

.BYTE   F5,SK,F5,SK,    FS5,SK,SK,SK,   F5,SK,F5,SK,    FS5,SK,RT,SK
.BYTE   RT,SK,SK,SK,    RT,SK,B4,SK,    AS4,SK,C5,D5,   DS5,SK,RT,SK                    ;20
.BYTE   F5,SK,F5,SK,    F5,E5,D5,SK,    F5,SK,F5,SK,    F5,E5,D5,SK                     ;21

;PAGE 3

.BYTE   F5,E5,D5,SK,    F5,E5,D5,SK,    AS5,A5,G5,SK,   AS5,A5,G5,SK,   RT,SK,SK,SK,     SK,SK,SK,SK     ;6/4 MEASURE
.BYTE   C5,SK,C5,SK,    CS5,SK,RT,SK,   C5,SK,C5,SK,    CS5,SK,RT,SK
.BYTE   CS5,CS5,CS5,SK, CS5,SK,C5,AS4,  A4,SK,F4,SK,    RT,SK,SK,SK                    ;24

.BYTE   AS4,SK,AS4,SK,  AS4,A4,G4,SK,   AS4,AS4,AS4,AS4,    AS4,A4,G4,SK
.BYTE   AS4,SK,F4,SK,   F4,F4,DS4,CS4,  C4,SK,SK,SK,    AS4,SK,RT,SK
.BYTE   F5,SK,F5,SK,    FS5,SK,SK,SK,   F5,SK,F5,SK,    FS5,SK,RT,SK                    ;27

.BYTE   RT,SK,SK,SK,    RT,SK,B4,SK,    AS4,SK,C5,D5,   DS5,SK,RT,SK
.BYTE   AS4,SK,AS4,SK,  AS4,A4,G4,SK,   C5,SK,C5,SK,    C5,AS4,G5,SK
.BYTE   F5,E5,D5,SK,    F5,E5,D5,SK,    AS5,A5,G5,SK,   AS5,A5,G5,SK,   RT,SK,SK,SK,    SK,SK,SK,SK     ;30 - 6/4 MEASURE 

;PAGE 4

.BYTE   A4,SK,A4,SK,    A4,SK,A4,SK,    A4,AS4,G4,SK,   G4,SK,SK,SK
.BYTE   G4,SK,G4,SK,    G4,SK,G4,SK,    G4,A4,AS4,SK,   A4,SK,SK,SK
.BYTE   A4,SK,SK,SK,    SK,SK,SK,SK,    C5,SK,SK,SK,    SK,SK,SK,SK     
.BYTE   G5,SK,G5,SK,    G5,A5,AS5,SK,   A5,SK,F5,SK,    RT,SK,RT,SK                     ;34

.BYTE   AS3,SK,AS3,SK,  G3,SK,RT,SK,    AS3,AS3,AS3,AS3,    DS4,SK,SK,SK
.BYTE   AS4,SK,F4,SK,   F4,F4,DS4,CS4,  C4,C4,C4,C4,    F4,SK,RT,SK
.BYTE   C6,SK,C6,SK,    C6,SK,A5,SK,    C6,SK,C6,C6,    C6,B5,A5,SK                     ;37

.BYTE   CS5,A5,A5,SK,   A5,SK,FS5,F5,   DS5,SK,AS5,SK,  AS5,SK,RT,SK
.BYTE   F5,SK,F5,SK,    F5,E5,D5,SK,    F5,SK,F5,SK,    F5,E5,D5,SK
.BYTE   F5,E5,D5,SK,    F5,E5,D5,SK,    AS5,A5,G5,SK,   AS5,A5,G5,SK,   RT,SK,SK,SK,    SK,SK,SK,SK         ;40 - 6/4 MEASURE

;PAGE 5

.BYTE   C5,SK,C5,SK,    CS5,SK,RT,SK,   C5,SK,C5,SK,    CS5,SK,RT,SK
.BYTE   CS5,CS5,CS5,SK, CS5,SK,C5,RT,   A4,SK,F4,SK,    RT,SK,A5,SK
.BYTE   E5,SK,SK,SK,    E5,SK,SK,SK,    E5,SK,SK,SK,    E5,SK,F5,SK                     ;43

.BYTE   D5,SK,SK,SK,    D5,SK,SK,SK,    D5,SK,SK,SK,    D5,SK,F5,SK
.BYTE   E5,SK,SK,SK,    E5,SK,SK,SK,    E5,SK,SK,SK,    E5,SK,F5,SK                     ;45

.BYTE   D5,SK,SK,SK,    D5,SK,F5,SK,    E5,SK,SK,SK,    C5,SK,SK,SK
.BYTE   A5,SK,SK,SK,    RT,SK,SK,SK,    RT,SK,SK,SK,    SK,SK,SK,SK                     ;47


.byte $ff



;PART B
partB:
.BYTE   RT,SK,SK,SK,	SK,SK,SK,SK,	RT,SK,SK,SK,    SK,SK,SK,SK                                                     ;INTRO
.BYTE   FS4,SK,G4,SK,   FS4,SK,G4,SK,   FS4,SK,G4,SK,   FS4,SK,G4,SK                    ;2
.BYTE   F4,SK,FS4,SK,   F4,SK,FS4,SK,   F4,SK,FS4,SK,   F4,SK,G4,SK
.BYTE   RT,SK,SK,SK,    SK,SK,SK,SK,    A4,SK,SK,SK,    G4,SK,E4,SK
.BYTE   F4,SK,SK,SK,    SK,SK,SK,SK,    RT,SK,SK,SK,    SK,SK,SK,SK                     ;5

.BYTE   D4,SK,SK,SK,    F4,SK,SK,SK,    A4,SK,A4,SK,    A4,SK,A4,SK
.BYTE   A4,SK,RT,SK,    A4,SK,RT,SK,    A4,SK,RT,SK,    A4,SK,AS4,SK
.BYTE   G4,SK,RT,SK,    G4,SK,RT,SK,    G4,SK,RT,SK,    G4,SK,AS4,SK
.BYTE   A4,SK,RT,SK,    A4,SK,RT,SK,    A4,SK,RT,SK,    A4,SK,AS4,SK                    ;9

.BYTE   G4,SK,D5,C5,    AS4,A4,G4,F4,   E4,SK,E5,D5,    F5,E5,F5,G5                     ;10
.BYTE   A5,SK,SK,SK,    A5,SK,SK,SK,    A5,AS5,G5,SK,   G5,SK,SK,SK
.BYTE   G5,SK,SK,SK,    G5,SK,SK,SK,    G5,A5,AS5,SK,   A5,SK,SK,SK                     ;12

;PAGE 2

.BYTE   A4,SK,SK,SK,    A4,SK,SK,SK,    C5,SK,AS4,SK,   G4,SK,SK,SK
.BYTE   G4,SK,G4,SK,    G4,A4,AS4,SK,   A4,SK,F4,SK,    E4,SK,SK,SK
.BYTE   C4,SK,C4,SK,    C4,B3,A3,SK,    C4,SK,C4,SK,    C4,B3,A3,SK                     ;15

.BYTE   C4,SK,G3,SK,    G3,SK,F4,E4,    D4,SK,A3,SK,    F4,SK,RT,SK
.BYTE   F5,SK,SK,SK,    AS4,SK,SK,SK,   AS5,SK,SK,SK,   F5,SK,RT,SK
.BYTE   CS5,SK,E5,SK,   E5,SK,FS5,D5,   DS5,SK,SK,SK,   DS5,SK,RT,SK                    ;18

.BYTE   F4,SK,F4,SK,    FS4,SK,SK,SK,   F4,F4,F4,F4,    FS4,SK,RT,SK
.BYTE   RT,SK,SK,SK,    SK,SK,SK,SK,    AS3,SK,C4,D4,   DS4,SK,RT,SK
.BYTE   F4,SK,F4,SK,    F4,E4,D4,SK,    F4,SK,F4,SK,    F4,E4,D4,SK                     ;21

;PAGE 3

.BYTE   F5,E5,D5,SK,    F5,E5,D5,SK,    AS4,A4,G4,SK, AS4,A4,G4,SK, RT,SK,SK,SK,    SK,SK,SK,SK     ;6/4 MEASURE
.BYTE   CS4,SK,CS4,SK,  AS3,SK,RT,SK,   CS4,SK,AS3,SK,  AS3,SK,RT,SK
.BYTE   F4,F4,F4,SK,    F4,SK,DS4,CS4,  C4,SK,AS3,SK,    AS3,SK,SK,SK                    ;24

.BYTE   AS3,SK,AS3,SK,  G3,SK,RT,SK,    AS3,AS3,AS3,AS3,    AS3,A3,G3,SK
.BYTE   AS5,SK,F5,SK,   F5,F5,DS5,CS5,  C5,SK,SK,SK,    AS4,SK,RT,SK
.BYTE   F4,SK,F4,SK,    FS4,SK,SK,SK,   F4,F4,F4,F4,    FS4,SK,RT,SK                    ;27

.BYTE   RT,SK,SK,SK,    SK,SK,SK,SK,    AS3,SK,C4,D4,   DS4,SK,RT,SK
.BYTE   AS4,SK,AS4,SK,  AS4,A4,G4,SK,   G4,SK,G4,SK,    G4,SK,DS4,SK
.BYTE   F5,E5,D5,SK,    F5,E5,D5,SK,    AS4,A4,G4,SK,   AS4,A4,G4,SK,   RT,SK,SK,SK,    SK,SK,SK,SK     ;30 -6/4 MEASURE

;PAGE 4

.BYTE   A5,SK,SK,SK,    A5,SK,SK,SK,    A5,AS5,G5,SK,   G5,SK,SK,SK
.BYTE   G5,SK,SK,SK,    G5,SK,SK,SK,    G5,A5,AS5,SK,   A5,SK,SK,SK
.BYTE   A4,SK,SK,SK,    A4,SK,SK,SK,    C5,SK,AS4,SK,   G4,SK,SK,SK
.BYTE   G4,SK,G4,SK,    G4,A4,AS4,SK,   A4,SK,F4,SK,    AS4,SK,A4,SK                    ;34

.BYTE   AS4,SK,AS4,SK,  AS4,A4,G4,SK,   AS4,AS4,AS4,AS4,    DS5,SK,SK,SK
.BYTE   AS5,SK,F5,SK,   F5,F5,DS5,CS5,  C5,SK,SK,SK,    C5,SK,B4,SK
.BYTE   C4,SK,C4,SK,    C4,SK,A3,SK,    C4,SK,C4,C4,    C4,B3,A3,SK                     ;37

.BYTE   CS5,A4,A4,SK,   A4,SK,FS4,F4,   DS4,SK,AS4,SK,  AS4,SK,RT,SK
.BYTE   F4,SK,F4,SK,    F4,E4,D4,SK,    F4,SK,F4,SK,    F4,E4,D4,SK
.BYTE   F5,E5,D5,SK,    F5,E5,D5,SK,    AS4,A4,G4,SK,   AS4,A4,G4,SK,   RT,SK,SK,SK,    SK,SK,SK,SK     ;40 - 6/4 MEASURE

;PAGE 5

.BYTE   CS4,SK,CS4,SK,  AS3,SK,RT,SK,   F3,SK,F3,SK,    G3,SK,RT,SK
.BYTE   F4,F4,F4,SK,    F4,SK,DS4,CS4,  C4,SK,AS3,SK,   AS3,SK,A4,SK
.BYTE   E4,SK,A4,A4,    E4,SK,A4,A4,    E4,SK,A4,A4,    E4,E4,A4,SK                    ;43

.BYTE   D4,SK,A4,A4,    D4,SK,A4,A4,    D4,SK,A4,A4,    D4,D4,F4,SK
.BYTE   E4,SK,A4,A4,    E4,SK,A4,A4,    E4,SK,A4,A4,    E4,E4,F4,SK                     ;45

.BYTE   D4,SK,A4,A4,    D4,SK,F4,SK,    E4,SK,SK,SK,    C5,B4,A4,G4
.BYTE   A4,SK,SK,SK,    RT,SK,SK,SK,    RT,SK,SK,SK,    SK,SK,SK,SK

.byte $ff


partC:
.BYTE   RT,SK,SK,SK,	SK,SK,SK,SK,	RT,SK,SK,SK,    SK,SK,SK,SK                                                     ;INTRO
.BYTE   B3,SK,C4,SK,    B3,SK,C4,SK,    B3,SK,C4,SK,    B3,SK,C4,SK                     ;2
.BYTE   AS3,SK,B3,SK,   AS3,SK,B3,SK,   AS3,SK,B3,SK,   AS3,SK,C4,SK    
.BYTE   F4,SK,E4,SK,    D4,SK,SK,SK,    SK,SK,SK,SK,    SK,SK,SK,SK
.BYTE   RT,SK,SK,SK,    E4,SK,SK,SK,    F4,SK,SK,SK,    E4,SK,SK,SK                     ;5

.BYTE   D4,SK,SK,SK,    RT,SK,SK,SK,    A3,SK,SK,SK,    A3,SK,A3,SK
.BYTE   D4,SK,A3,SK,    D4,SK,A3,SK,    D4,SK,A3,SK,    A3,SK,RT,SK
.BYTE   G4,SK,AS4,SK,   G4,SK,AS4,SK,   G4,SK,AS4,SK,   G4,SK,AS4,SK
.BYTE   CS4,SK,AS3,SK,  A3,SK,RT,SK,    A3,SK,RT,SK,    A3,SK,RT,SK                     ;9

.BYTE   RT,SK,SK,SK,    CS4,SK,SK,SK,   A3,SK,SK,SK,    SK,SK,RT,SK                     ;10
.BYTE   A3,SK,SK,SK,    A3,SK,SK,SK,    A3,SK,G3,SK,    G3,SK,SK,SK
.BYTE   G3,SK,SK,SK,    G3,SK,SK,SK,    G3,SK,AS3,SK,   A3,SK,SK,SK                     ;12

;PAGE 2

.BYTE   A3,SK,A3,SK,    A3,SK,AS3,SK,   C4,SK,AS3,A3,   G3,SK,SK,SK
.BYTE   D5,SK,SK,SK,    D5,SK,SK,SK,    RT,SK,SK,SK,    A3,SK,B3,SK
.BYTE   C5,SK,C5,SK,    C5,B4,A4,SK,    C5,SK,C5,SK,    C5,B4,A4,SK                     ;15

.BYTE   C5,SK,G4,SK,    G4,SK,F4,E4,    D4,SK,A4,SK,    AS4,SK,RT,SK
.BYTE   AS4,SK,SK,SK,   AS4,SK,SK,SK,   F5,SK,SK,SK,    AS4,SK,RT,SK
.BYTE   CS4,SK,FS4,SK,  FS4,SK,RT,SK,   AS4,SK,SK,SK,   AS4,SK,RT,SK                    ;18

.BYTE   F3,SK,F3,SK,    FS3,SK,SK,SK,   F3,SK,F3,SK,    FS3,SK,F3,SK
.BYTE   B3,SK,G4,SK,    G4,SK,B3,SK,    RT,SK,SK,SK,    DS4,SK,GS3,SK
.BYTE   F3,SK,F3,SK,    F3,A3,D4,SK,    F3,SK,F3,SK,    F3,A3,D4,SK                     ;21

;PAGE 3

.BYTE   F4,E4,D4,SK,    F4,E4,D4,SK,    AS3,A3,G3,SK,   RT,SK,SK,SK,    G4,SK,E4,SK,    AS3,SK,G3,SK        ;6/4 MEASURE
.BYTE   F3,SK,F3,SK,    FS3,SK,RT,SK,   F3,SK,F3,SK,    FS3,SK,RT,SK
.BYTE   AS3,AS3,AS3,SK, AS3,SK,AS3,AS3, F4,SK,A4,SK,    AS4,SK,SK,SK                    ;24


.BYTE   AS3,SK,AS4,SK,  G4,SK,RT,SK,    AS3,SK,AS4,SK,  G4,SK,RT,SK
.BYTE   F4,SK,SK,SK,    FS4,SK,SK,SK,   F4,SK,SK,SK,    AS3,SK,RT,SK
.BYTE   F3,SK,F3,SK,    FS3,SK,SK,SK,   F3,SK,F3,SK,    FS3,SK,F3,SK                    ;27

.BYTE   B3,SK,G4,SK,    G4,SK,B3,SK,    RT,SK,SK,SK,    DS4,SK,AS3,SK
.BYTE   AS3,SK,AS3,SK,  AS3,A3,G3,SK,   C4,SK,C4,SK,    C4,A3,G3,SK
.BYTE   F4,E4,D4,SK,    F4,E4,D4,SK,    AS3,A3,G3,SK,   RT,SK,SK,SK,    RT,SK,SK,SK,    SK,SK,SK,SK     ;30 - 6/4 MEASURE

;PAGE 4

.BYTE   A3,SK,SK,SK,    A3,SK,SK,SK,    A3,SK,G3,SK,    G3,SK,SK,SK
.BYTE   G3,SK,SK,SK,    G3,SK,SK,SK,    G3,SK,AS3,SK,   A3,SK,SK,SK
.BYTE   A3,SK,A3,SK,    A3,SK,AS3,SK,   C4,SK,AS3,A3,   G3,SK,SK,SK
.BYTE   D5,SK,SK,SK,    D5,SK,SK,SK,    RT,SK,SK,SK,    AS3,SK,A3,SK                    ;34

.BYTE   AS3,SK,AS4,SK,  G4,SK,RT,SK,    AS3,SK,AS3,SK,  DS4,SK,SK,SK
.BYTE   F4,SK,SK,SK,    FS4,SK,SK,SK,   F4,SK,SK,SK,    C4,SK,B3,SK
.BYTE   C5,SK,C5,SK,    C5,SK,A4,SK,    C5,SK,C5,C5,    C5,B4,A4,SK                     ;37

.BYTE   CS4,SK,FS4,SK,  FS4,SK,RT,SK,   DS4,SK,AS4,SK,  AS4,SK,RT,SK
.BYTE   F3,SK,F3,SK,    F3,A3,D4,SK,    F3,SK,F3,SK,    F3,A3,D4,SK
.BYTE   F4,E4,D4,SK,    F4,E4,D4,SK,    AS3,A3,G3,SK,   RT,SK,SK,SK,    G4,SK,D4,SK,    AS3,SK,G3,SK    ;40 - 6/4 MEASURE

;PAGE 5

.BYTE   F3,SK,F3,SK,    FS3,SK,RT,SK,   F3,SK,F3,SK,    FS3,SK,RT,SK  
.BYTE   AS3,AS3,AS3,SK, AS3,SK,AS3,AS3, F4,SK,A4,SK,    AS4,SK,A4,SK
.BYTE   A4,A4,A4,A4,    A4,A4,A4,A4,    A4,A4,A4,A4,    A4,SK,RT,SK                     ;43

.BYTE   A4,A4,A4,A4,    A4,A4,A4,A4,    A4,A4,A4,A4,    A4,SK,RT,SK
.BYTE   GS4,GS4,GS4,GS4,    GS4,GS4,GS4,GS4,    GS4,GS4,GS4,GS4,    GS4,SK,RT,SK        ;45

.BYTE   A4,A4,A4,A4,    A4,A4,A4,A4,    GS4,GS4,GS4,GS4,    GS4,SK,RT,SK
.BYTE   RT,SK,SK,SK,    SK,SK,SK,SK,    RT,SK,SK,SK,    SK,SK,SK,SK                     ;47



.byte $ff



partD:
.BYTE   RT,SK,SK,SK,	SK,SK,SK,SK,	RT,SK,SK,SK,    SK,SK,SK,SK                                                     ;INTRO
.BYTE   FS4,SK,SK,SK,   FS4,SK,SK,SK,   FS4,SK,SK,SK,   FS4,SK,SK,SK                    ;2
.BYTE   F4,SK,SK,SK,    F4,SK,SK,SK,    F4,SK,SK,SK,    F4,SK,SK,SK
.BYTE   E4,SK,G4,SK,    A4,SK,SK,SK,    SK,SK,SK,SK,    RT,SK,SK,SK
.BYTE   RT,SK,SK,SK,    B4,SK,SK,SK,    SK,SK,SK,SK,    SK,SK,SK,SK                     ;5

.BYTE   A4,SK,SK,SK,    RT,SK,SK,SK,    RT,SK,SK,SK,    SK,SK,SK,SK
.BYTE   A4,SK,SK,SK,    A4,SK,SK,SK,    A4,SK,SK,SK,    SK,SK,RT,SK
.BYTE   B4,SK,SK,SK,    B4,SK,SK,SK,    B4,SK,SK,SK,    SK,SK,RT,SK
.BYTE   GS4,SK,SK,SK,   E4,SK,SK,SK,    E4,SK,SK,SK,    SK,SK,RT,SK                     ;9

.BYTE   F4,SK,SK,SK,    C5,SK,SK,SK,    E5,SK,SK,SK,    RT,SK,SK,SK                     ;10
.BYTE   E4,SK,SK,SK,    E4,SK,SK,SK,    RT,SK,SK,SK,    D4,SK,SK,SK
.BYTE   D4,SK,SK,SK,    D4,SK,SK,SK,    RT,SK,SK,SK,    E4,SK,SK,SK                     ;12

;PAGE 2

.BYTE   E4,SK,RT,SK,    RT,SK,F4,SK,    G4,SK,F4,E4,    D4,SK,SK,SK
.BYTE   D4,SK,SK,SK,    D5,SK,SK,SK,    C5,SK,A4,SK,    B4,SK,SK,SK
.BYTE   B4,SK,SK,SK,    RT,SK,SK,SK,    B4,SK,SK,SK,    RT,SK,SK,SK                     ;15

.BYTE   G4,SK,D5,SK,    D5,SK,C5,B4,    A4,SK,E4,SK,    F4,SK,RT,SK
.BYTE   C5,SK,SK,SK,    RT,SK,SK,SK,    F4,SK,SK,SK,    RT,SK,SK,SK
.BYTE   RT,SK,SK,SK,    SK,SK,SK,SK,    AS4,SK,SK,SK,   AS4,SK,RT,SK                    ;18

.BYTE   C5,SK,SK,SK,    CS5,SK,SK,SK,   C5,SK,SK,SK,    CS5,SK,RT,SK       
.BYTE   FS4,SK,D5,SK,   D5,SK,FS4,SK,   RT,SK,SK,SK,    AS4,SK,F4,SK
.BYTE   C5,SK,C5,SK,    C5,B4,A4,SK,    C5,SK,C5,SK,    C5,B4,A4,SK                     ;21

;PAGE 3

.BYTE   RT,SK,SK,SK,    SK,SK,SK,SK,    F4,E4,D4,SK,    F4,E4,D4,SK, RT,SK,SK,SK,   SK,SK,SK,SK         ;6/4 MEASURE
.BYTE   F4,SK,SK,SK,    GS4,SK,RT,SK,   F4,SK,SK,SK,    GS4,SK,RT,SK
.BYTE   RT,SK,SK,SK,    SK,SK,SK,SK,    G4,SK,C5,SK,    F4,SK,SK,SK                     ;24

.BYTE   F4,SK,F4,SK,    A4,SK,RT,SK,    F4,SK,F4,SK,    A4,SK,RT,SK
.BYTE   C5,SK,SK,SK,    CS5,SK,SK,SK,   C5,SK,SK,SK,    F4,SK,RT,SK
.BYTE   C5,SK,SK,SK,    CS5,SK,SK,SK,   C5,SK,SK,SK,    CS5,SK,RT,SK                    ;27

.BYTE   FS4,SK,D5,SK,   D5,SK,FS4,SK,   RT,SK,SK,SK,    AS4,SK,F4,SK
.BYTE   F4,SK,SK,SK,    RT,SK,SK,SK,    G4,SK,SK,SK,    RT,SK,SK,SK
.BYTE   RT,SK,SK,SK,    SK,SK,SK,SK,    F4,E4,D4,SK,    F4,E4,D4,SK, RT,SK,SK,SK, SK,SK,SK,SK           ;30 - 6/4 MEASURE

;PAGE 4

.BYTE   E4,SK,SK,SK,    E4,SK,SK,SK,    RT,SK,SK,SK,    D4,SK,SK,SK
.BYTE   D4,SK,SK,SK,    D4,SK,SK,SK,    RT,SK,SK,SK,    E4,SK,SK,SK
.BYTE   E4,SK,RT,SK,    SK,SK,F4,SK,    G4,SK,F4,E4,    D4,SK,SK,SK
.BYTE   D4,SK,SK,SK,    D5,SK,SK,SK,    RT,SK,SK,SK,    AS3,SK,A3,SK                    ;34

.BYTE   F4,SK,F4,SK,    A4,SK,RT,SK,    F4,SK,F4,SK,    AS4,SK,SK,SK
.BYTE   C5,SK,SK,SK,    CS5,SK,SK,SK,   C5,SK,SK,SK,    RT,SK,RT,SK
.BYTE   G4,SK,SK,SK,    RT,SK,SK,SK,    E5,SK,SK,SK,    RT,SK,SK,SK                     ;37

.BYTE   RT,SK,SK,SK,    SK,SK,SK,SK,    AS4,SK,F5,SK,   F5,SK,RT,SK
.BYTE   C5,SK,C5,SK,    C5,B4,A4,SK,    C5,SK,C5,SK,    C5,B4,A4,SK
.BYTE   RT,SK,SK,SK,    SK,SK,SK,SK,    F4,E4,D4,SK,    F4,E4,D4,SK,    RT,SK,SK,SK,    SK,SK,SK,SK       ;40 - 6/4 MEASURE

;PAGE 5

.BYTE   F4,SK,SK,SK,    GS4,SK,RT,SK,   F4,SK,SK,SK,    GS4,SK,RT,SK
.BYTE   RT,SK,SK,SK,    SK,SK,SK,SK,    G4,SK,C5,SK,    F4,SK,SK,SK         
.BYTE   B4,SK,SK,SK,    B4,SK,SK,SK,    B4,SK,SK,SK,    B4,SK,C5,SK                     ;43

.BYTE   A4,SK,SK,SK,    A4,SK,SK,SK,    A4,SK,SK,SK,    A4,SK,C5,SK
.BYTE   B4,SK,SK,SK,    B4,SK,SK,SK,    B4,SK,SK,SK,    B4,SK,C5,SK                     ;45

.BYTE   A4,SK,SK,SK,    A4,SK,C5,SK,    B4,SK,SK,SK,    G4,SK,SK,SK
.BYTE   E4,SK,SK,SK,    RT,SK,SK,SK,    RT,SK,SK,SK,    SK,SK,SK,SK 


.byte $ff

musicTable: .word partA,partB,partC,partD