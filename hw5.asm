section .data
	num1 dd 5
	num2 dd 15
	num3 dd 11
	num4 dd 25
	num5 dd 21

section .bss
	evenN resd 11		; 11 even #'s incl 0
	largest resd 1

section .text
	global _start

_start:
	; Generate even numbers up to 20
	mov ecx, 0		; starting counter from 0
	mov ebx, evenN		; move array to ebx

even_num:
	; Find even numbers and store
	mov eax, ecx		; load value
	shl eax, 1		; multiply by 2^1
	mov [ebx], eax		; store number
	inc ecx			; increments counter
	add ebx, 4		; moves to next element

	; Check if counter reached
	cmp ecx, 11		; check if 11
	jl even_num		; repeats until 11


	; Find largest of 5 integers
	mov eax, [num1]		; load num1
	mov ebx, [num2]		; load num2
	cmp eax, ebx		; compares first with second
	jg comp_num3		; jumps if num1 > num2
	mov eax, [num2]		; if num2 is greater

comp_num3:
	mov ebx, [num3]		; loads next number
	cmp eax, ebx		; compares numbers
	jg comp_num4		; jumps if eax > num3
	mov eax, [num3]		; if num3 is greater

comp_num4:
	mov ebx, [num4]		; loads next number
	cmp eax, ebx
	jg comp_num5		; jumps if eax > num4
	mov eax, [num4]		; if num4 is greater

comp_num5:
	mov ebx, [num5]		; loads next number
	cmp eax, ebx
	jg largest_num		; jumps if eax > num5
	mov eax, [num5]		; if num5 is greater

largest_num:
	mov [largest], eax	; stores eax in largest

	mov eax, 1
	xor ebx, ebx
	int 0x80
