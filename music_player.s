; ************************************************************************************************************************************		
; Music Player




music:
		
		lda musicOn
		beq noMusic
		inc mTimer							; increment the music timer
		lda mTimer							; load and compare with set time
		cmp mspeed 							; to determine if we should play the next note
		beq playNotes						
noMusic:
		rts


playNotes:
		;inc nCounter				  	;increment the note counter
		stz mTimer						; reset the timer	

nextNote:
VL1:

		ldy #$00
		lda ($70),y 
		cmp #SK
		beq done1
		cmp #RT
		beq rest1
		cmp #$ff
		bne nextL1Note
		lda #<partA
		sta $70
		lda #>partA
		sta $71
		lda gameOn
		bne VL1
		stz musicOn
		bra VL1
rest1:
		stz SID_L1_GATE
		bra done1
nextL1Note:

		tax								; transfer note to x for indexing
		stz SID_L1_GATE					; close gate
		lda freq,x						; load the frequency lo from the table
		sta SID_L1_FREQ_L				; store in register
		lda freq+1,x 					; load frequency hi from the table
		sta SID_L1_FREQ_H				; store in the register

		lda #waveType						
		sta SID_L1_GATE

done1:
		clc
		lda $70
		adc #$01
		sta $70
		lda $71
		adc #$00
		sta $71



VL2:
		ldy #$00
		lda ($72),y 
		cmp #SK
		beq done2
		cmp #RT
		beq rest2
		cmp #$ff
		bne nextL2Note
		lda #<partB
		sta $72
		lda #>partB
		sta $73
		bra VL2
rest2:
		stz SID_L2_GATE
		bra done2
nextL2Note:
		;asl
		


		tax
		stz SID_L2_GATE
		lda freq,x 
		sta SID_L2_FREQ_L
		lda freq+1,x 
		sta SID_L2_FREQ_H
		lda #waveType
		sta SID_L2_GATE
done2:
		clc
		lda $72
		adc #$01
		sta $72
		lda $73
		adc #$00
		sta $73
;		rts

VR1:
		ldy #$00
		lda ($74),y 
		cmp #SK
		beq done3
		cmp #RT
		beq rest3
		cmp #$ff
		bne nextR1Note
		lda #<partC
		sta $74
		lda #>partC
		sta $75
		bra VR1
rest3:
		stz SID_R1_GATE
		bra done3
nextR1Note:
		tax
		stz SID_R1_GATE
		lda freq,x 
		sta SID_R1_FREQ_L
		lda freq+1,x 
		sta SID_R1_FREQ_H
		lda #waveType
		sta SID_R1_GATE
done3:
		clc
		lda $74
		adc #$01
		sta $74
		lda $75
		adc #$00
		sta $75


harmony:
VR2:
		ldy #$00
		lda ($76),y 
		cmp #SK
		beq done4
		cmp #RT
		beq rest4
		cmp #$ff
		bne nextR2Note
		lda #<partD
		sta $76
		lda #>partD
		sta $77
		bra VR2
rest4:
		stz SID_R2_GATE
		bra done4
nextR2Note:
		;asl
		sec
		sbc #38
		tax
		stz SID_R2_GATE
		lda freq,x 
		sta SID_R2_FREQ_L
		lda freq+1,x 
		sta SID_R2_FREQ_H
		lda #waveType
		sta SID_R2_GATE
done4:
		clc
		lda $76
		adc #$01
		sta $76
		lda $77
		adc #$00
		sta $77
		rts

; ************************************************************************************************************************************	