[BITS 16]
[ORG 0x7c00]

_start:
	cli

	xor ax, ax

	mov ss, ax
	mov sp, ax
	mov ds, ax
	mov es, ax

	; preserve BIOS disk number
	mov [0x500], dl

	mov ah, 02h
	mov al, 16
	mov ch, 0
	mov cl, 2
	mov dh, 0

	mov dl, [0x500]
	mov bx, 0x2000

	int 13h
	jc halt

	xor ax, ax
	xor bx, bx
	xor cx, cx
	xor dx, dx
	xor si, si
	xor di, di

	mov sp, 0x2000
	jmp 0x2000

halt:
	hlt
	jmp halt
