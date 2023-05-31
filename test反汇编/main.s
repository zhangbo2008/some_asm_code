// 删除部分标识   gcc -S main.c -o main.s -O0

//   gcc 的汇编使用的是AT&T指令.
add:
.LFB0:
	// 0. 可以看到函数开始之前， 会主动将父函数的栈内容进行保存
	pushq	%rbp
	movq	%rsp, %rbp
	
	// 1. 将参数按顺序写入栈中
	movl	%edi, -20(%rbp)
	movl	%esi, -24(%rbp)
	movl	%edx, -28(%rbp)
	movl	%ecx, -32(%rbp)
	movl	%r8d, -36(%rbp)
	movl	%r9d, -40(%rbp)
	
	// 2. 依次取出进行运算
	movl	-20(%rbp), %edx
	movl	-24(%rbp), %eax
	addl	%eax, %edx
	movl	-28(%rbp), %eax
	addl	%eax, %edx
	movl	-32(%rbp), %eax
	addl	%eax, %edx
	movl	-36(%rbp), %eax
	addl	%eax, %edx
	movl	-40(%rbp), %eax
	addl	%eax, %edx
	movl	16(%rbp), %eax
	addl	%eax, %edx
	movl	24(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -4(%rbp)

	// 3. 将返回值赋值给%eax
	movl	-4(%rbp), %eax
	
	// 4. 因为整个过程中没有push指令，所以编译器没调用leave，而是popq ，将父函数的栈还给%rsp，然后ret
	popq	%rbp
	ret

main:
.LFB1:
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$16, %rsp   // 将rsp下移 ，预留空间
	
	// 超过6个的参数，会先入栈
	pushq	$88
	pushq	$77
	movl	$66, %r9d
	movl	$55, %r8d
	movl	$44, %ecx
	movl	$33, %edx
	movl	$22, %esi
	movl	$11, %edi
	call	add
	// 栈顶指针直接上移16个字节，将pushq 的88 和 77 都给清理掉
	addq	$16, %rsp
	
	// 将函数调用结果存入 rbp - 12的位置
	movl	%eax, -12(%rbp)
	
	// 一样的调用方式
	pushq	$8
	pushq	$7
	movl	$6, %r9d
	movl	$5, %r8d
	movl	$4, %ecx
	movl	$3, %edx
	movl	$2, %esi
	movl	$1, %edi
	call	add
	addq	$16, %rsp
	
	// 将调用结果存入 rbp - 8 的位置
	movl	%eax, -8(%rbp)
	
	// 取出之前的调用结果，然后相加，存入rbp - 4位置
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -4(%rbp)

	// return 0
	movl	$0, %eax
	leave
	ret
