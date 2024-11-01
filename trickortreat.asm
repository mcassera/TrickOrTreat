;Trick or Treat - October 2024 Game Jam!
;Michael Cassera 2024
; 



.cpu "w65c02"						; set the cpu to Western Digital 65C02
.include "setup.asm"		; all of our initial settings
.include "notes.s"


*=$a0										; Set up buffer for Kernel communication
.dsection zp						; Define position for zp (zero page)
.cerror * > $af, "Too many Zero page variables"

; ************************************************************************************************************************************
*=$1ffd

start:										; ***TEMP CODE FOR PROGRAMMING***
		jmp SC								; Start of the program - We put this jump here so you can load the PGZ into the computer.
											; With the self running code below, you can boot into it in RAM. Without this jump, loading a PGZ will
											; hit the self running code the kernel needs at the start of the slot at $2000 and look like a freeze.
											; hitting the reset on the back of the F256k will start the program.



.include "api.asm"							; This is the Kernel API for communication

;SetupKernel:								; Set up the API to work with

.section zp									; Zero page section $20 to $28
event:	.dstruct	kernel.event.event_t
.send
; ************************************************************************************************************************************
*=$2000										; ***TEMP CODE FOR PROGRAMMING***
											; Self running code to send via USB port the F256. Allows me to quickly load into emulator
											; dipswitch 1 should be set to on.
		.byte $f2,$56						; Required bytes for the Kernel to identify
		.byte $04,$01						; how big is the program in 8K sections, What slot to map to
		.byte $0b,$20						; the starting address of your program
		.byte $00,$00,$00,$00				; reserved
		.byte $00							; terminating byte
; ************************************************************************************************************************************
											; *****My program starts here!*****
SC:


		stz MMU_IO_CTRL						; should do this on every program
		jsr clearTextScreen
; ************************************************************************************************************************************

;init_events:
		lda #<event
		sta kernel.args.events
		lda #>event
		sta kernel.args.events+1
; ************************************************************************************************************************************
;Set up TinyVicky to display sprites
		lda #%00110111						; Graphic, Tiles, & Sprites Engine enabled  |xx|GM|SP|TL|BM|GR|OV|TX|
		sta VKY_MSTR_CTRL_0					;                  		                    | 0| 0| 1| 1| 0| 1| 1| 1|

		lda #%00000000						; Text mode options for the overlay 		|xx|xx|FS|FO|MS|2Y|2X|70|
		sta VKY_MSTR_CTRL_1					; 320 x 240, 60 Hz, dbl X & Y				| 0| 0| 0| 0| 0| 0| 0| 0|
		stz VKY_BRDR_CTRL					; No Border
	
		lda #$88							; Set the background color
		sta VKY_BKG_COL_R
		lda #$88
		sta VKY_BKG_COL_G
		lda #$88
		sta VKY_BKG_COL_B
	
;Set up TinyVicky to display tiles
		lda #%01010100						;Layer 0 = tilemap 2, Layer 1 = tilemap 1  |xx|LA YE R1|xx|LA YE R0|
		sta VKY_LAYER_CTRL_0				;						 				   | 0| 1| 0| 1| 0| 1| 0| 0|
		lda #%00000110						;Layer 2 = TileMap 0					   |xx|xx|xx|xx|xx|LA YE R2|	
		sta VKY_LAYER_CTRL_1				;										   | 0| 0| 0| 0| 0| 1| 1| 0|

;Set TileSet 2 for our background
		lda #<background
		sta VKY_TS2_AD_L
		lda #>background
		sta VKY_TS2_AD_M
		lda #$01							
		sta VKY_TS2_AD_H

;Set TileSet 1 for our trees
		lda #<trees
		sta VKY_TS1_AD_L
		lda #>trees
		sta VKY_TS1_AD_M
		lda #$01							
		sta VKY_TS1_AD_H

;Set TileSet 0 for our Title Image
		lda #<title
		sta VKY_TS0_AD_L
		lda #>Title
		sta VKY_TS0_AD_M
		lda #$01							
		sta VKY_TS0_AD_H

;Set Tile Map 2
		lda #%00000001						; 16 x 16 tiles, enable					   |xx|xx|xx|TS|xx|xx|xx|EN|
		sta VKY_TM2_CTRL					;										   | 0| 0| 0| 0| 0| 0| 0| 1|
		lda #20								; Tile Map Size 20 X 
		sta VKY_TM2_SZ_X
		lda #15								; Tile Map Size 15 Y
		sta VKY_TM2_SZ_Y

		lda #<background_map				; Point to the Tile Map Data, LOW BYTE
		sta VKY_TM2_AD_L
		lda #>background_map				; Point to the Tile Map Data, MEDIUM BYTE
		sta VKY_TM2_AD_M
		lda #$01							; Point to the Tile Map Data, HIGH BYTE
		sta VKY_TM2_AD_H
	
;Set Tile Map 1
		lda #%00000001						; 16 x 16 tiles, enable					   |xx|xx|xx|TS|xx|xx|xx|EN|
		sta VKY_TM1_CTRL					;										   | 0| 0| 0| 0| 0| 0| 0| 1|
		lda #20								; Tile Map Size 20 X 
		sta VKY_TM1_SZ_X
		lda #15								; Tile Map Size 200 Y
		sta VKY_TM1_SZ_Y

		lda #<trees_map						; Point to the Tile Map Data, LOW BYTE
		sta VKY_TM1_AD_L
		lda #>trees_map						; Point to the Tile Map Data, MEDIUM BYTE
		sta VKY_TM1_AD_M
		lda #$01							; Point to the Tile Map Data, HIGH BYTE
		sta VKY_TM1_AD_H

;Set Tile Map 0
		lda #%00000000						; 16 x 16 tiles, enable					   |xx|xx|xx|TS|xx|xx|xx|EN|
		sta VKY_TM0_CTRL					;										   | 0| 0| 0| 0| 0| 0| 0| 1|
		lda #20								; Tile Map Size 20 X 
		sta VKY_TM0_SZ_X
		lda #15								; Tile Map Size 03 Y	

		lda #<title_map						; Point to the Tile Map Data, LOW BYTE
		sta VKY_TM0_AD_L
		lda #>title_map						; Point to the Tile Map Data, MEDIUM BYTE
		sta VKY_TM0_AD_M	
		lda #$01							; Point to the Tile Map Data, HIGH BYTE
		sta VKY_TM0_AD_H


; ************************************************************************************************************************************
;Load the CLUT into memory
		lda #$01							; Change I/O control to page 1
		sta MMU_IO_CTRL
		lda #<CLUT0							; Set source pointer to CLUT for color information
		sta ptr_src
		lda #>CLUT0
		sta ptr_src+1

		lda #<VKY_GR_CLUT_0					; Set destination pointer to Graphics CLUT 0
		sta ptr_dst
		lda #>VKY_GR_CLUT_0
		sta ptr_dst+1

		ldx #$00							; X is the number of colors to copy, check for 154
		ldy #$22
; ************************************************************************************************************************************
makeClut:
		sty totalColors
color_loop:
		ldy #$00							; Y points to the color component (Blue Red Green Alpha)
comp_loop:
		lda (ptr_src),y						; Read byte from our color table 
		sta (ptr_dst),y						; write byte to the Graphic CLUT
		iny
		cpy #$04							; Do 4 bytes for one color + Alpha
		bne comp_loop

		inx
		cpx totalColors						; Loop for all colors of the CLUT
		beq done_lut

		clc									; Move the source pointer to the next Color
		lda ptr_src
		adc #$04
		sta ptr_src
		lda ptr_src+1
		adc #$00
		sta ptr_src+1

		clc									; Move the destination pointer to the next Color
		lda ptr_dst
		adc #$04
		sta ptr_dst
		lda ptr_dst+1
		adc #$00
		sta ptr_dst+1

		jmp color_loop						; and start copying the next color
done_lut:
		stz MMU_IO_CTRL

; ************************************************************************************************************************************
setFont:									; let's change the font
		lda #<font
		sta $80
		lda #>font
		sta $81
		lda #$c1
		stz $82
		sta $83
		ldy #$00
		ldx #$03
		lda #$01
		sta MMU_IO_CTRL
_sfLoop:
		lda ($80),y
		sta ($82),y 
		iny
		bne _sfLoop
		inc $81
		inc $83
		dex
		bne _sfLoop
		stz MMU_IO_CTRL

; ************************************************************************************************************************************

setMoon:
		lda #$11							;moon
		sta $daa0
		lda #<moon
		sta $daa1
		lda #>moon
		sta $daa2
		lda #$01
		sta $daa3
		lda #$60
		sta $daa4
		sta moonXLO
		lda #$01
		sta $daa5
		sta moonXHI
		lda #$32
		sta $daa6
		sta moonYLO
		stz $daa7
		stz moonYHI
		lda #$55							;setting a dude
		sta $d9a6

;reset SID
		ldx #$00
sidLooop:
		lda #$00
		sta $d400,x 
		sta $d500,x 
		inx
		cpx #$18
		bcc sidLooop
		beq sidLooop

; ************************************************************************************************************************************
GameStart:

		lda #kernel.args.timer.FRAMES		; set the Timer to Frames
		ora #kernel.args.timer.QUERY		; and query what frame we're on
		sta kernel.args.timer.units			; store in units parameter
		jsr kernel.Clock.SetTimer			; jsr to Kernel Routine
		bcs skipSet							; If Carry set, ignore
		adc #$01							; if not add 1 to Accumulator for next frame
		sta $d0
skipSet:
		jsr SetTimer						; Let's get the kernel set up for the timer
		;jmp GameLoop

;set music address
		ldx #$00
mAdd:
		lda musicTable,x 
		sta $70,x 
		inx
		cpx #$09
		bne mAdd


; ************************************************************************************************************************************

systemStart:
		stz $d200
;set random number generator

		lda #$01	
		sta Random_Reg




; set music instruments
		lda #$0f							; set the SID volume to 15
		sta SID_L_VOL
		sta SID_R_VOL
		lda #$37 
		sta SID_L1_ATDL
		sta SID_R1_ATDL
		sta SID_L2_ATDL
		sta SID_R2_ATDL
		lda #$52
		sta SID_R1_STRL
		sta SID_L1_STRL
		sta SID_R2_STRL
		sta SID_L2_STRL



; ************************************************************************************************************************************

setPlayer:
		lda #$11							;player
		sta $d9a0
		lda #<player2
		sta $d9a1
		lda #>player2
		sta $d9a2
		lda #$01
		sta $d9a3
		lda #$48
		sta $d9a4
		stz $d9a5

		stz $d9a7



; ************************************************************************************************************************************
setCandy:
		ldx #$00
cLoop:
		lda #$38
		sta candy_XLO,x						; X position of candy LO
		lda #$00
		sta candy_XHI,x 					; X position of candy HI
		lda #21
		sta candy_Flag,x					; current state (on steps)
		lda candy_Home,x					; home position of candy
		sta candy_YLO,x						; current y pos of candy
		lda candy_SP_Reg,x					; sprite register LO
		sta $38								; store for y indexing
		lda #$da							; sprite register HI
		sta $39 							; store for y indexing


		ldy #$00
		lda #$11							; Set sprite on
		sta ($38),y
		iny
		phx
		txa 
		asl
		tax
		lda candyOrder,x					; set data address LO
		sta ($38),y
		iny
		lda candyOrder+1,x					; set data address MED
		sta ($38),y
		plx
		iny
		lda #$01							; set data Address HI
		sta ($38),y	
		iny
		lda candy_XLO,x 					; set X POS LO
		sta ($38),y
		iny
		lda #$00							; set X POS HI
		sta ($38),y
		iny
		lda candy_YLO,x						; set Y POS LO
		sta ($38),y
		iny
		lda #$00							; set Y POS HI
		sta ($38),y

		inx
		cpx #20
		beq candyDone
		bra cLoop

candyDone:

; ************************************************************************************************************************************

;set basic parameters
		lda #$01
		sta level
		stz score
		stz score+1
		stz happyKids
		stz happyKids+1
		stz happyKidsHex
		stz happyKidsHex+1
		lda #$04
		sta speed

		ldx #$00
; ************************************************************************************************************************************
setKidsSpeedLoop:
		lda Random_L
		and #$03
		clc
		adc #$04
		sta kids_Speed,x 
		lda Random_L
		and #$03
		tay
		lda playerPosTable,y 
		sta kids_YLO,x
		lda #$60
		sta kids_XLO,x 
		lda #$01
		sta kids_XHI,x 
		sta kids_Flag,x 
		lda #$00
		sta kids_Treat,x 

		inx
		cpx #20
		bcc setKidsSpeedLoop




; ************************************************************************************************************************************

GameLoop:									; This is where we sit if not handling events 

		jsr handle_events					; check the events handler

		lda gameOn
		beq endGame
		jmp GameLoop



endGame:
		lda #$01
		sta $d200
		ldx #$00
		lda simpleCounter
		adc #$78
		sta $22
		
eGameLoop:
		jsr handle_events
		lda simpleCounter
		cmp $22
		bne eGameLoop
checkToStart:
		jsr handle_events
		lda joyB
		beq checkToStart
		stx joyB

startGame:
		inc gameOn
		inc musicOn
		jmp systemStart

; ************************************************************************************************************************************

handle_events:
		lda kernel.args.events.pending		; Peek at the queue to see if anything is pending
		bpl done_handle_events				; Nothing to do
		jsr kernel.NextEvent				; Get the next event.
		bcs done_handle_events				; If Carry is set, skip the handler
		jsr dispatch						; Handle the event
		jmp handle_events					; go and check for another event
done_handle_events:
		rts 								

dispatch:
		lda event.type						; get the event type from Kernel
		cmp #kernel.event.timer.EXPIRED		; is the event timer.EXPIRED?
		beq UpdateScreen					; run the screen update
		cmp #kernel.event.JOYSTICK			; is the event a Joystick Change?
		beq setJoyStick
		rts

; ************************************************************************************************************************************
;Read the joystick on event and set a direction to be used during the SOF cycle
setJoyStick:
		lda event.joystick.joy1
		sta $d8								; Temp save joystick state
		stz joyX							; reset all directions and button to zero
		stz joyY
		stz joyB
		;bne jButton
jUp:
		lda $d8								; reload joystick state
		and #$01							; check for up
		beq jDown							; if not up skip to test down
		dec joyY							; if up dec joy Y direction to $ff
		bra jButton							; skip down test
jDown:
		lda $d8								; reload joystick state
		and #$02							; check for down
		beq jButton							; if not down skip 
		inc joyY							; incrment Joy y direction to $01

jButton:		
		lda $d8								; reload joystick state
		and #$10							; check for button 0
		beq jDone							; no button, we are done
		lda #$01
		sta joyB							; yes botton, set joy B to 1

jDone:
		rts										


; ************************************************************************************************************************************
; These are events that happen at SOF, 60 times per second
UpdateScreen:
		jsr SetTimer						; Reset the next timer for SOF
		jsr music
		jsr checkJoy
		jsr moonrise
		inc simpleCounter

		lda gameOn
		beq noPlay

		jsr walkers							; These are the trick or treaters
		jsr checkB
		jsr throwCandy
		jsr scoring
		jsr checkLevelUp
		
noPlay:			
		rts

; ************************************************************************************************************************************

checkJoy:
		lda moving
		bne move
		lda joyY
		beq joyDone
		cmp #$01
		beq goDown
		cmp #$ff
		beq goUP
		bra joyDone
move:
		clc
		lda playerYLO
		adc pDir
		sta playerYLO
		sta $d9a6
		inc playerStep
		lda playerStep
		and #$03
		asl
		tax
		lda pDir
		bmi faceAway
		lda playerTable1,x 
		sta $d9a1
		lda playerTable1+1,X
		sta $d9a2
		bra checkPOS
faceAway:
		lda playerTable2,x 
		sta $d9a1
		lda playerTable2+1,X
		sta $d9a2
		bra checkPOS
checkPOS:
		ldx playerPOS
		lda playerPosTable,x 
		cmp playerYLO
		bne joyDone
		stz moving

		bra joyDone

goDown:
		lda playerPOS
		cmp #$03
		beq joyDone
		inc moving
		inc playerPOS
	    lda #$02
		sta pDir
		bra joyDone
goUP:
		lda playerPOS
		beq joyDone
		inc moving
		dec playerPOS
		lda #$fd
		sta pDir
		;bra checkB

joyDone:
		rts

hc:
		jmp holdCandy

; ************************************************************************************************************************************

checkB:
		lda joyB
		beq noPress
		lda playerCandy
		cmp #21
		bne hc
		jsr getCandy
		jmp doneButton
getCandy:
		ldx #$00
gCandyLoop:
		lda #$01
		sta joyHold
		lda candy_Flag,x 
		cmp #21
		bne nextCandy
		lda candy_YLO,x 
		cmp playerYLO
		bne nextCandy
		stx playerCandy
		lda #$01
		sta candy_Flag,x
		lda #$40
		sta candy_XLO,x

		lda candy_SP_Reg,x					; sprite register LO
		sta $38								; store for y indexing
		lda #$da							; sprite register HI
		sta $39 							; store for y indexing
		ldy #SP_POS_X_L
		lda candy_XLO,x 					; get X POS LO
		sta ($38),y
		lda #<player7		
		sta playerSP+SP_AD_L
		lda #>player7
		sta playerSP+SP_AD_M
		lda #$01
		sta playerSP+SP_AD_H
		bra clDone
nextCandy:
		inx
		cpx #21 
		bne gCandyLoop
		stx playerCandy
clDone:
		rts

noPress:
		
		lda joyHold
		beq doneButton
		lda playerCandy
		tax
		inc candy_Flag,x 
		lda #21
		sta playerCandy



		lda #<player8
		sta playerSP+SP_AD_L
		lda #>player8
		sta playerSP+SP_AD_M
		lda #$01
		sta playerSP+SP_AD_H
		stz joyHold
		bra doneButton


holdCandy:


doneButton:
		rts

throwCandy:
		ldx #$00
tLoop:
		lda candy_Flag,x 
		cmp #$02
		bne nt
		clc
		lda candy_XLO,x 
		adc #$01
		sta candy_XLO,x
		lda candy_XHI,x
		adc #$00
		sta candy_XHI,x 

		lda candy_XLO,x 						;take candy out of the game if off the board
		cmp #$60
		bcc cCollision
		lda candy_XHI,x 
		beq cCollision
		lda #$ff
		sta candy_Flag,x

		;bra cCollision
nt:		jmp nextThrow
cCollision:
		ldy #$00
collision:
		lda candy_XLO,x 
		cmp kids_XLO,y 
		bcc nextKid
		lda candy_XHI,x
		cmp kids_XHI,y 
		bne nextKid
		lda candy_YLO,x 
		cmp kids_YLO,y 
		bne nextKid
		lda kids_Treat,y 
		bne nextKid
		bra hit
nextKid:	
		iny
		cpy #21
		bne collision
		jmp draWThrow
hit:
		lda #$01
		sta kids_Treat,y 

		lda #$38
		sta candy_XLO,x						; X position of candy LO
		lda #$00
		sta candy_XHI,x 					; X position of candy HI
		lda #21
		sta candy_Flag,x					; current state (on steps)
		lda candy_Home,x					; home position of candy
		sta candy_YLO,x						; current y pos of candy


		sed
		clc 
		lda happyKids
		adc #$01
		sta happyKids
		lda happyKids+1
		adc #$00
		sta happyKids+1

		stx $80
		
		ldx level
		clc
		lda score
		adc levelScoring,x 
		sta score
		lda score+1
		adc #$00
		sta score+1
		cld
		
		clc 
		lda happyKidsHex
		adc #$01
		sta happyKidsHex
		lda happyKidsHex+1
		adc #$00
		sta happyKidsHex+1

		lda levelAdvance,x
		cmp happyKidsHex
		bne keepLevel
		inc levelUpFlag
		inc level
		lda level
		cmp #$06
		bne keepLevel
		dec level



keepLevel:
		
		ldx $80


draWThrow:

		lda candy_SP_Reg,x					; sprite register LO
		sta $38								; store for y indexing
		lda #$da							; sprite register HI
		sta $39 							; store for y indexing

		ldy #$00
		lda #$11							; Set sprite on
		;sta ($38),y
		iny
		phx
		txa 
		asl
		tax
		lda candyOrder,x					; set data address LO
		sta ($38),y
		iny
		lda candyOrder+1,x					; set data address MED
		sta ($38),y
		plx
		iny
		lda #$01							; set data Address HI
		sta ($38),y	
		iny
		lda candy_XLO,x 					; set X POS LO
		sta ($38),y
		iny
		lda candy_XHI,x						; set X POS HI
		sta ($38),y
		iny
		lda candy_YLO,x						; set Y POS LO
		sta ($38),y
		iny
		lda #$00							; set Y POS HI
		sta ($38),y
		bra nextThrow

nextThrow:
		inx
		cpx #20
		beq throwDone
		jmp tLoop
throwDone:
		rts

; ************************************************************************************************************************************

walkers:
		ldx #00								; there are 20 walkers, This loop deals with each of them one at a time
_walker_loop:
		lda kids_Flag,x						; is the flag on - check to see if this walker is activated, not all walkers are on all the time
		bne _checkTimer						; yes
		jmp _skipWalker
_checkTimer:
		lda kids_Count,x					; This checks a countdown timer - we're using SOF as a clock and movement is based on multiple counts of the clock
		beq _move_walker					; once the countdown reaches zero, we take a step
		dec kids_Count,x					; if not, we reduce the counter by one, save the data and move on to the next walker
		jmp _skipWalker
_move_walker:
		lda kids_Treat,x					; This checks to see if the walker has a treat already. This makes the walker head back off the screen to the right
		bne _exitPath						; the walker will also not accespt anymore candy
		lda kids_Speed,x					; this resets the counter for timing - $27 is the hard number and $28 countdowns from the number
		sta kids_Count,x					; this resets it after a step has been taken
		sec
		lda kids_XLO,x						; $23 and $24 are the LO/HI X location for the walker
		sbc #$01							; since we are going left, we are subtracting 1 pixel when taking a step
		sta kids_XLO,x 	
		lda kids_XHI,x
		sbc #$00
		sta kids_XHI,x 

		inc kids_SP_Step,x					; $2b is the step counter to point to the proper walking sprite for the walker
		clc
		lda kids_SP_Step,x					; we load up $2b and and it with $03 because there are only 4 sprites for the walker stride
		and #$03 		
		adc kids_SP,x						; then we add it to the character base (witch, reaper, vampire, lady vampire, ghost, Jack )
		asl									; we then multiply by two because we are looking up a 16 bit address 
		tay									; transfer to y to look up on our lookup table
		lda charTable,y
		sta $2e								; and save to zero page for indirect indexing
		lda charTable+1,y 
		sta $2f 
		jsr _writeSpriteData				; write the data to the sprite registers


		lda kids_XLO,x						; check if we hit the wall
		cmp #$5b 
		bne _noSwitchBack
		lda kids_XHI,x
		bne _noSwitchBack
		lda #$01
		sta kids_Treat,x
		stz gameOn
_noSwitchBack:
		jmp _skipWalker


_writeSpriteData:		
		lda kids_SP_Reg,x 
		sta $2c
		lda #$d9
		sta $2d
		ldy #$00							; now we are writing our new information to the sprite register
		lda #$11							; starting with the enable/layer byte
		sta ($2c),y
		iny
		lda $2e 
		sta ($2c),y							; sprite definition address LO
		iny 
		lda $2f
		sta ($2c),y							; sprite definition address MID
		iny
		lda #$02
		sta ($2c),y							; sprite definition address HI
		iny
		lda kids_XLO,x
		sta ($2c),y							; X location LO
		iny
		lda kids_XHI,x
		sta ($2c),y							; x location HI
		iny
		lda kids_YLO,x 
		sta ($2c),y							; y location LO
		iny
		lda #$00
		sta ($2c),y							; y location HI
		rts

_exitPath:				
		lda #$00 							; this resets the counter for timing - After getting candy the walker runs out
		sta kids_Count,x					; this resets it after a step has been taken
		clc
		lda kids_XLO,x						; $23 and $24 are the LO/HI X location for the walker
		adc #$01							; since we are going right, we are adding 1 pixel when taking a step
		sta kids_XLO,x 	
		lda kids_XHI,x 
		adc #$00
		sta kids_XHI,x 

		dec kids_SP_Step,x					; $2b is the step counter to point to the proper walking sprite for the walker
		clc
		lda kids_SP_Step,x					; we load up $2b and and it with $03 because there are only 4 sprites for the walker stride
		and #$03 		
		adc kids_SP,x						; then we add it to the character base (witch, reaper, vampire, lady vampire, ghost, Jack )
		asl									; we then multiply by two because we are looking up a 16 bit address 
		tay									; transfer to y to look up on our lookup table
		lda charTable2,y
		sta $2e								; and save to zero page for indirect indexing
		lda charTable2+1,y 
		sta $2f 
		jsr _writeSpriteData				; write the data to the sprite registers

		lda kids_XLO,x						; check if we walk off right
		cmp #$61
		bne _stillOn
		lda kids_XHI,x
		beq _stillOn
		lda #$00
		sta kids_Treat,x

		lda Random_L
		and #$03
		clc
		adc speed
		sta kids_Speed,x 

		lda Random_L
		and #$03
		tay
		lda playerPosTable,y 
		sta kids_YLO,x






_stillOn:



_skipWalker:
		inx									; increment x to the next walker
		cpx #20								; have we done all twenty
		beq _done							; yes - we are done
		jmp _walker_loop					; using a jmp because it is too far for a branching command

_done:
		rts									; we are done with all walkers, return

; ************************************************************************************************************************************

moonrise:
		lda moonXCount
		bne checkMoonY
		sec
		lda moonXLO
		sbc #$01
		sta moonXLO
		sta $daa4
		lda moonXHI
		sbc #$00
		sta moonXHI
		sta $daa5
		bmi resetMoon
		lda #$80
		sta moonXCount
checkMoonY:
		dec moonXCount
		lda moonyCountHI
		bne doneMoon
		sec
		lda moonYLO
		sbc #$01
		sta moonYLO
		sta $daa6
		lda #$06
		sta moonyCountHI
		bra doneMoon
resetMoon:
		lda #$60
		sta $daa4
		sta moonXLO
		lda #$01
		sta $daa5
		sta moonXHI
		lda #$32
		sta $daa6
		sta moonYLO
doneMoon:
		sec
		lda moonyCount
		sbc #$01
		sta moonyCount
		lda moonyCountHI
		sbc #$00
		sta moonyCountHI
		rts


; ************************************************************************************************************************************

SetTimer:	
		inc $d0
		lda $d0
		sta kernel.args.timer.absolute		; store in timer.absolute paramter
		sta kernel.args.timer.cookie		; saved as a cookie to the kernel (same as frame number)
		lda #kernel.args.timer.FRAMES		; set the Timer to Frames
		sta kernel.args.timer.units			; store in units parameter
		jsr kernel.Clock.SetTimer			; jsr to Kernel routine to set timer
		rts

clearTextScreen:							; clear the text screen for overlay purposes
		lda #$02							; need to be in the right IO output to write to screen
		sta MMU_IO_CTRL
		ldx #$00							; set x to zero, we'll go once around all 256 bytes
loopClearText:
		lda #$20							; the space character
		sta $c000,x 						; store it in all the screen locations
		sta $c100,x 
		sta $c200,x 
		sta $c300,x 
		sta $c400,x 
		sta $c500,x 
		sta $c600,x 
		sta $c700,x 	
		sta $c800,x 
		sta $c900,x 
		sta $ca00,x 
		sta $cb00,x 
		sta $cc00,x 
		sta $cd00,x 
		sta $ce00,x 
		sta $cd00,x 
		sta $ce00,x 
		sta $cf00,x 
		sta $d000,x 
		sta $d100,x 
		sta $d1c0,x 						; this last group is not a full 256 bytes so there's some overlap
		inx									; increment x
		bne loopClearText					; if we haven't looped all the way around to zero, keep looping
		stz MMU_IO_CTRL						; reset io control back to zero
		rts

; ************************************************************************************************************************************	

checkLevelUp:
		;stz MMU_IO_CTRL
		lda levelUpFlag
		beq checkLevelDone
		stz levelUpFlag
		ldx level
		lda levelCandy,x 
		tax
reduceCandy:
		;lda #$00
		;sta candy_home,x 
		lda #$ff
		sta candy_Flag,x 

		lda candy_SP_Reg,x					; sprite register LO
		sta $30								; store for y indexing
		lda #$da							; sprite register HI
		sta $31 							; store for y indexing


		ldy #$00
		lda #$00
		sta ($30),y

		dex
		cpx #$ff
		bne reduceCandy

adjustSpeed:
		ldx level
		lda levelSpeed,x 
		sta speed






checkLevelDone:
		rts

; ************************************************************************************************************************************	
scoring:
		lda #$02
		sta MMU_IO_CTRL
		lda score+1
		lsr
		lsr
		lsr
		lsr
		tax
		lda numbers,x 
		sta $c026
		lda score+1
		and #$0f 
		tax 
		lda numbers,x 
		sta $c027

		lda score
		lsr
		lsr
		lsr
		lsr
		tax
		lda numbers,x 
		sta $c028
		lda score
		and #$0f 
		tax 
		lda numbers,x 
		sta $c029


		lda happyKids+1
		lsr
		lsr
		lsr
		lsr
		tax
		lda numbers,x 
		sta $c043
		lda happyKids+1
		and #$0f 
		tax 
		lda numbers,x 
		sta $c044

		lda happyKids
		lsr
		lsr
		lsr
		lsr
		tax
		lda numbers,x 
		sta $c045
		lda happyKids
		and #$0f 
		tax 
		lda numbers,x 
		sta $c046

		lda level
		and #$0f
		tax
		lda numbers,x 
		sta $c010

		ldx #$00
writeText:
		lda textScore,x 
		sta $c01a,x 
		lda textKids,x 
		sta $c038,x 
		lda textLevel,x 
		sta $c005,x
		inx
		cpx #$0b
		bcc writeText


		stz MMU_IO_CTRL



		rts


; ************************************************************************************************************************************	
.include "music_player.s"



;working memory	
gameOn			.byte $00
musicOn			.byte $00
happyKids:		.word $0000
score:			.word $0000
level:			.byte $01
numbers:		.text "0123456789"
textScore:		.text "     SCORE:"
textKids:		.text "Happy Kids:"
textLevel:		.text "     Level:"
happyKidsHex:	.word $0000
levelUpFlag:	.byte $00
speed:			.byte $00
simpleCounter:	.byte $00

kids_Flag:		.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
kids_XLO:		.byte $60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60,$60
kids_XHI:		.byte $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01
kids_YLO:		.byte $55,$85,$b5,$e5,$55,$85,$b5,$e5,$55,$85,$b5,$e5,$55,$85,$b5,$e5,$55,$85,$b5,$e5
kids_Treat:		.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
kids_Speed:		.byte $03,$06,$04,$04,$07,$02,$01,$04,$08,$01,$03,$02,$05,$09,$0a,$05,$02,$04,$08,$02
kids_Count:		.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
kids_SP:		.byte $00,$04,$08,$0c,$10,$14,$00,$04,$08,$0c,$10,$14,$00,$04,$08,$0c,$10,$14,$00,$04
kids_SP_Step:	.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
kids_SP_Reg:	.byte $00,$08,$10,$18,$20,$28,$30,$38,$40,$48,$50,$58,$60,$68,$70,$78,$80,$88,$90,$98


charTable:	.word	sprite1,sprite2,sprite3,sprite2								;00		witch left
			.word	sprite9,sprite10,sprite11,sprite10							;04		reaper left
			.word	sprite17,sprite18,sprite19,sprite18							;08		dracula left
			.word	sprite25,sprite26,sprite27,sprite26							;0c		lady drac left
			.word	sprite33,sprite34,sprite35,sprite34							;10		ghost left
			.word	sprite41,sprite42,sprite43,sprite42							;14		jack left
charTable2:	.word	sprite4,sprite5,sprite6,sprite5								;00		witch right
			.word	sprite12,sprite13,sprite14,sprite13							;04		reaper right
			.word	sprite20,sprite21,sprite22,sprite21							;08		dracula right
			.word	sprite28,sprite29,sprite30,sprite29							;0c		lady drac right
			.word	sprite36,sprite37,sprite38,sprite37							;10		ghost right
			.word	sprite44,sprite45,sprite46,sprite45							;14		jack right



candy_Flag:		.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
candy_XLO:		.byte $38,$38,$38,$38,$38,$38,$38,$38,$38,$38,$38,$38,$38,$38,$38,$38,$38,$38,$38,$38
candy_XHI:		.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
candy_YLO:		.byte $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
candy_Home:		.byte $55,$85,$b5,$e5,$55,$85,$b5,$e5,$55,$85,$b5,$e5,$55,$85,$b5,$e5,$55,$85,$b5,$e5
candy_SP_Reg:	.byte $00,$08,$10,$18,$20,$28,$30,$38,$40,$48,$50,$58,$60,$68,$70,$78,$80,$88,$90,$98


candyOrder:
			.word candy1,candy2,candy3,candy4,candy5
			.word candy2,candy4,candy5,candy3,candy1
			.word candy3,candy1,candy2,candy5,candy4
			.word candy4,candy5,candy1,candy2,candy3

playerXLO:			.byte	$48
playerXHI:			.byte	$00
playerYLO:			.byte	$55
playerYHI:			.byte	$00
playerPOS:			.byte 	$00
playerStep:			.byte 	$00
playerCandy:		.byte 21
playerPosTable:		.byte $55,$85,$b5,$e5
moving:				.byte $00
pDir				.byte $00

playerTable1:	.word player1,player2,player3,player2
playerTable2:	.word player4,player5,player6,player5

moonXLO:			.byte $00
moonXHI:			.byte $00
moonYLO:			.byte $00
moonYHI:			.byte $00
moonXCount:			.byte $00
moonyCount:			.byte $00
moonyCountHI:		.byte $00

totalColors:	.byte $00
joyX:			.byte $00
joyY:			.byte $00
joyB:			.byte $00
joyHold:		.byte $00

levelCandy:		.byte $00,$00,$03,$07,$0b,$0f
levelSpeed:		.byte $00,$04,$03,$02,$01,$00
levelAdvance:	.byte $00,10,20,40,60,$ff
levelScoring:	.byte $00,$01,$02,$04,$0a,$15



* = $0500								;Lots of room for data before the program.

font:
;.binary "ScaryCaps.bin"
.binary "fat_letters.bin"

;palatte data
.include "trickortreat_pal.s"
.include "SID_Freq.s"
.include "game_music.s"




* = $10000 




title:
.include "Title_tileset.s"
trees:
.include "Trees_tileset.s"
background:
.include "Backgroundtile_tileset.s"

title_map:
;.binary "tt0.tlm"							; for emulator
.binary "tt0h.tlm"							; for hardware

trees_map:
;.binary "tt1.tlm"							; for emulator
.binary "tt1h.tlm"							; for hardware

background_map:
;.binary "tt2.tlm"							; for emulator
.binary "tt2h.tlm"							; for hardware

.include "player.s"
.include "candy2.s"
.include "moon.s"

* = $20000

characters:
.include "Characters.s"

