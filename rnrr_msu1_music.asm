lorom

; MSU memory map I/O
MSU_STATUS = $2000
MSU_ID = $2002
MSU_AUDIO_TRACK_LO = $2004
!MSU_AUDIO_TRACK_HI = $2005
!MSU_AUDIO_VOLUME = $2006
!MSU_AUDIO_CONTROL = $2007

; SPC communication ports
SPC_COMM_0 = $2140
SPC_COMM_1 = $2141
SPC_COMM_2 = $2142
SPC_COMM_3 = $2143

; MSU_STATUS possible values
MSU_STATUS_TRACK_MISSING = $8
MSU_STATUS_AUDIO_PLAYING = %00010000
MSU_STATUS_AUDIO_REPEAT  = %00100000
MSU_STATUS_AUDIO_BUSY    = $40
MSU_STATUS_DATA_BUSY     = %10000000

; Constants
FULL_VOLUME = $FF

; Hijack transfert SPC music after incrementing which song to play
org $808129
	jsr MSU_Main

; Hijack for stop music (end of course)
org $8080C1
	jsr MSU_Stop
	
; Hijack for stop music (demo mode)
org $808110
	jsr MSU_Stop
	
; Hack code
org $80FF27
MSU_Main:
	php
	rep #$30
	pha
	phx
	phy
	
	sep #$30
	; Check if MSU-1 is present
	lda.w MSU_ID
	cmp #'S'
	bne .MSUNotFound
	
.MSUFound:
	; Set track
	sty.w MSU_AUDIO_TRACK_LO
	stz.w !MSU_AUDIO_TRACK_HI

.CheckAudioStatus
	lda.w MSU_STATUS
	
	and.b #MSU_STATUS_AUDIO_BUSY
	bne .CheckAudioStatus
	
	; Check if track is missing
	lda.w MSU_STATUS
	and.b #MSU_STATUS_TRACK_MISSING
	bne .MSUNotFound
	
	; Always loop the song
	lda #$03
	sta !MSU_AUDIO_CONTROL
	
	; Set volume
	lda.b #FULL_VOLUME
	sta.w !MSU_AUDIO_VOLUME

	rep #$30
	ply
	plx
	pla
	plp
	rts
	
; Call original routine if MSU-1 is not found
.MSUNotFound:
	rep #$30
	ply
	plx
	pla
	plp
	
	jsr $F904
	rts

MSU_Stop:
	php
	rep #$30
	pha
	
	sep #$30
	; Check if MSU-1 is present
	lda.w MSU_ID
	cmp #'S'
	bne .MSUNotFound
	
	lda #$00
	sta !MSU_AUDIO_CONTROL
	
	rep #$30
	pla
	plp
	rts
.MSUNotFound:
	rep #$30
	pla
	plp
	
	jsr $F986
	rts