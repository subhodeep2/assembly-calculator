%include "util.asm"

GLOBAL _start

section .text

_start:
 
	mov rdi,num1
	call printstr
	call readint
	mov [user_num1],rax
	mov rdi,num2
	call printstr
	call readint
	mov rdi,operators
	call printstr
	mov [user_num2],rax
	mov rdi,user_operators
	mov rsi,2
	call readstr

cmp_oprators:

	mov rdi,[user_operators]
	cmp rdi,43 ; +
	je addition
	cmp rdi,45 ; -
	je subtraction
	cmp rdi,42 ; *
	je multiply
	cmp rdi,47 ; /
	je division

exception:

	mov rdi,error_mssg
	call printstr
	call endl
	call exit0

addition:
	mov rdi,[user_num1]
	add rdi,[user_num2]
	call results

subtraction:
 
	mov rdi,[user_num1]
	sub rdi,[user_num2]
	call results

multiply:

	mov rdi,[user_num1]
	imul rdi,[user_num2]
	call results

division:
    
    mov rbx,0
	mov rax,[user_num1]
	mov rbx,[user_num2]
	idiv rbx
	mov rdi,rax
	call results
results:

	call printstr
	call endl
	call exit0

section .data

	num1: db "Enter your 1st number: ",0
	num2: db "Enter your 2nd number: ",0
	operators: db "Enter operation to perform(+,-,*,/): ",0
	error_mssg: db "Cannot perfrom this operation!!!"

section .bss

	user_num1: resb 8
	user_num2: resb 8
	user_operators: resb 2