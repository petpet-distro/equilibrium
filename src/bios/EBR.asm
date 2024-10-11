[BITS 16]
[ORG 0x2000]

_start:
	mov si, MSG_EQLIB
	call puts
	jmp halt

halt:
	hlt
	jmp halt

putc:
	push ax

	mov ah, 0x0e
	int 10h

	pop ax

	ret

puts:
	push ax
	push si

	.loop:
		mov al, BYTE[si]
		inc si

		cmp al, 0
		je .finish

		call putc

		jmp .loop

	.finish:
		pop si
		pop ax
		ret

MSG_EQLIB db "Equilibrium", 13, 10, 0
