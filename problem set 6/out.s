.data
.INTEGER: .string "%d "
.STRING0: .string "A is different from 10"
.STRING1: .string "B is different from -15"
.STRING2: .string "B equals -15"
.globl main
.text
_while_test:
	pushl	%ebp
	movl	%esp,%ebp
	pushl	%ebp
	movl	%esp,%ebp
	pushl	$0
	pushl	$0
	pushl	$10
	pushl	%ebp
	popl	%ebx
	popl	%eax
	movl	%eax,-4(%ebp)
	movl	%ebx,%ebp
	pushl	$-15
	pushl	%ebp
	popl	%ebx
	popl	%eax
	movl	%eax,-8(%ebp)
	movl	%ebx,%ebp
	pushl	%ebp
	movl	-4(%ebp),%eax
	popl	%ebp
	pushl	%eax
	pushl	$10
	popl	%ebx
	popl	%eax
	subl	%ebx,%eax
	pushl	%eax
	popl	%eax
	cmpl	$0,%eax
	jz	_else_0
	pushl	$.STRING0
	call	printf
	popl	%eax
	pushl	$0x0A
	call	putchar
	popl	%eax
	jmp	_endif_0
_else_0:
_endif_0:
	pushl	%ebp
	movl	-4(%ebp),%eax
	popl	%ebp
	pushl	%eax
	popl	%eax
	cmpl	$0,%eax
	jz	_else_1
	pushl	%ebp
	movl	-8(%ebp),%eax
	popl	%ebp
	pushl	%eax
	pushl	$15
	popl	%eax
	popl	%ebx
	addl	%ebx,%eax
	pushl	%eax
	popl	%eax
	cmpl	$0,%eax
	jz	_else_2
	pushl	$.STRING1
	call	printf
	popl	%eax
	pushl	$0x0A
	call	putchar
	popl	%eax
	jmp	_endif_2
_else_2:
	pushl	$.STRING2
	call	printf
	popl	%eax
	pushl	$0x0A
	call	putchar
	popl	%eax
_endif_2:
	jmp	_endif_1
_else_1:
_endif_1:
	pushl	$0
	popl	%eax
	leave
	leave
	ret
	leave
	leave
	ret
main:
	pushl	%ebp
	movl	%esp,%ebp
	movl	8(%esp),%esi
	decl	%esi
	jz	noargs
	movl	12(%ebp),%ebx
pusharg:
	addl	$4,%ebx
	pushl	$10
	pushl	$0
	pushl	(%ebx)
	call	strtol
	addl	$12,%esp
	pushl	%eax
	decl	%esi
	jnz	pusharg
noargs:
	call	_while_test
	leave
	pushl	%eax
	call	exit
