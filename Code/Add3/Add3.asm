;－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
; by Loomman, QQ:28077188, MSN: Loomman@hotmail.com QQ裙：30515563
; Add3.asm
;－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
;有两个４字长（８字节）数分别存放在ＤＡＴＡ１和ＤＡＴＡ２
;请用８０８６指令求出他们的和，并把结果放在ＤＡＴＡ３

.model small
.386
.data
	data1		dq	123456789abcdefh
	data2		dq	0fedcba987654321h
	data3		dq	?

.code

start:
	mov	ax, @data
	mov	ds, ax

	clc
	lea	si, data1
	lea	di, data2
	lea	bx, data3
	mov	cx, 2

back:
	mov	eax, [si]
	adc	eax, [di]
	mov	[bx], eax
	pushf  ;把eflag放入栈
	add	si, 4
	add	di, 4
	add	bx, 4
	popf  ;把栈顶放入efalgs
;数据是反着放的. 小位置地址小,也就是12345
;在内存里面放的顺序是54321. 
;查看变量的方法是先按回车,然后输入你要查询的寄存器或者变量的名字. 更好的方法是.左下角watches里面右键之后选择watch,然后输入你要查看的变量名. 比如si, di , [si], [di]都可以.   这个代码里面lea	si, data1
;表示的含义是把data1的地址给si, [si]表示的是si的地址里面的数值. []就是c语言里面的根据地址取内容的意思.
	loop	back

	mov	ax, 4c00h
	int	21h

	end start