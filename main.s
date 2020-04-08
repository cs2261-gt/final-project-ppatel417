	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStartState
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStartState, %function
goToStartState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r2, #0
	mov	ip, #7936
	mov	r0, #256
	ldr	r1, .L4+24
	strh	ip, [r3, #8]	@ movhi
	strh	r0, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r2, [r1]
	bx	lr
.L5:
	.align	2
.L4:
	.word	waitForVBlank
	.word	DMANow
	.word	startScreenPal
	.word	startScreenTiles
	.word	100726784
	.word	startScreenMap
	.word	state
	.size	goToStartState, .-goToStartState
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	goToStartState
	.size	initialize, .-initialize
	.align	2
	.global	goToInstructionState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructionState, %function
goToInstructionState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L9
	mov	lr, pc
	bx	r3
	ldr	r4, .L9+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L9+8
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L9+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L9+16
	ldr	r1, .L9+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7936
	mov	r2, #0
	mov	ip, #256
	mov	r0, #1
	ldr	r1, .L9+24
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L10:
	.align	2
.L9:
	.word	waitForVBlank
	.word	DMANow
	.word	instructionScreenPal
	.word	instructionScreenTiles
	.word	100726784
	.word	instructionScreenMap
	.word	state
	.size	goToInstructionState, .-goToInstructionState
	.align	2
	.global	goToGameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGameState, %function
goToGameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #4352
	mov	r4, #67108864
	mov	r3, #40448
	ldr	r5, .L13
	strh	r2, [r4]	@ movhi
	strh	r3, [r4, #8]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L13+4
	mov	lr, pc
	bx	r5
	mov	r3, #16
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L13+8
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L13+12
	ldr	r1, .L13+16
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #0
	mov	r1, #2
	ldr	r2, .L13+20
	strh	r3, [r4, #16]	@ movhi
	strh	r3, [r4, #18]	@ movhi
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	DMANow
	.word	gameScreenPal
	.word	gameScreenTiles
	.word	100724736
	.word	gameScreenMap
	.word	state
	.size	goToGameState, .-goToGameState
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L27
	ldr	r3, .L27+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L16
	ldr	r2, .L27+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L25
.L16:
	tst	r3, #4
	beq	.L15
	ldr	r3, .L27+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L26
.L15:
	pop	{r4, lr}
	bx	lr
.L26:
	pop	{r4, lr}
	b	goToInstructionState
.L25:
	bl	goToGameState
	ldrh	r3, [r4]
	b	.L16
.L28:
	.align	2
.L27:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	startState, .-startState
	.align	2
	.global	instructionState
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructionState, %function
instructionState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L41
	ldr	r3, .L41+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L30
	ldr	r2, .L41+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L39
.L30:
	tst	r3, #4
	beq	.L29
	ldr	r3, .L41+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L40
.L29:
	pop	{r4, lr}
	bx	lr
.L40:
	pop	{r4, lr}
	b	goToStartState
.L39:
	bl	goToGameState
	ldrh	r3, [r4]
	b	.L30
.L42:
	.align	2
.L41:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.size	instructionState, .-instructionState
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	instructionState
	.size	pauseState, .-pauseState
	.align	2
	.global	goToPauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPauseState, %function
goToPauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L46
	mov	lr, pc
	bx	r3
	ldr	r4, .L46+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L46+8
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L46+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L46+16
	ldr	r1, .L46+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7936
	mov	r2, #0
	mov	ip, #768
	mov	r0, #3
	strh	r1, [r3, #8]	@ movhi
	ldr	lr, .L46+24
	ldr	r1, .L46+28
	strh	lr, [r3, #10]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L47:
	.align	2
.L46:
	.word	waitForVBlank
	.word	DMANow
	.word	pauseScreenPal
	.word	pauseScreenTiles
	.word	100726784
	.word	pauseScreenMap
	.word	7684
	.word	state
	.size	goToPauseState, .-goToPauseState
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L55
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L55+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L48
	ldr	r3, .L55+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L54
.L48:
	pop	{r4, lr}
	bx	lr
.L54:
	pop	{r4, lr}
	b	goToPauseState
.L56:
	.align	2
.L55:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	gameState, .-gameState
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L64
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L64+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L57
	ldr	r3, .L64+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L63
.L57:
	pop	{r4, lr}
	bx	lr
.L63:
	pop	{r4, lr}
	b	goToStartState
.L65:
	.align	2
.L64:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	loseState, .-loseState
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L77
	mov	lr, pc
	bx	r3
	ldr	r6, .L77+4
	ldr	fp, .L77+8
	ldr	r5, .L77+12
	ldr	r10, .L77+16
	ldr	r7, .L77+20
	ldr	r9, .L77+24
	ldr	r8, .L77+28
	ldr	r4, .L77+32
.L67:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L68:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L68
.L70:
	.word	.L73
	.word	.L71
	.word	.L72
	.word	.L71
	.word	.L69
.L71:
	mov	lr, pc
	bx	r7
	b	.L67
.L73:
	mov	lr, pc
	bx	r10
	b	.L67
.L69:
	mov	lr, pc
	bx	r8
	b	.L67
.L72:
	mov	lr, pc
	bx	r9
	b	.L67
.L78:
	.align	2
.L77:
	.word	goToStartState
	.word	state
	.word	buttons
	.word	oldButtons
	.word	startState
	.word	instructionState
	.word	gameState
	.word	loseState
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	goToLoseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLoseState, %function
goToLoseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L81
	mov	lr, pc
	bx	r3
	ldr	r4, .L81+4
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L81+8
	mov	lr, pc
	bx	r4
	mov	r3, #16
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L81+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L81+16
	ldr	r1, .L81+20
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7936
	mov	r2, #0
	mov	ip, #256
	mov	r0, #4
	ldr	r1, .L81+24
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L82:
	.align	2
.L81:
	.word	waitForVBlank
	.word	DMANow
	.word	loseScreenPal
	.word	loseScreenTiles
	.word	100726784
	.word	loseScreenMap
	.word	state
	.size	goToLoseState, .-goToLoseState
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	shadowOAM,1024,4
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
