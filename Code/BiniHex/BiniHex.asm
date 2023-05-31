;－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
; by Loomman, QQ:28077188, MSN: Loomman@hotmail.com QQ裙：30515563
; BiniHex.asm
;－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
;二进制数到１６进制数转换程序
;本程序把ＢＸ寄存器内的２进制数用１６进制的形式在屏幕上显示出来
;  tasm/masm 插件选择jsdos masm-v6.11 没有图形界面了debug. 只能调试了...
;很有意思的项目, ascii吗算的很有意思!!!!!!!!!!
program segment

main proc far
	assume cs:program
start:
	;set up stack for return
	push	ds
	sub	ax, ax
	push	ax

	;main part of prognam
	mov	bx, 00111B ; 这里面输入二进制的数据. 以B结尾.不管这里面数据是啥进制, 内存中都会自动转化为16进制来存储.

	mov	ch, 4		;number of digits   ;我们输出的最大16进制有4个字符. 我们旋转4次.
rotate:
	mov	cl, 4		;set count to 4 bits
	rol	bx, cl		;left digit to right
	mov	al, bl		;mov to al
	and	al, 0fh		;mask off left digit
	add	al, 30h		;convert hex to ASC2 #16进制转化为asc吗.  假设我们输入0, 0的ascii吗是30.所以我们这地方要al加30h即可. 
	cmp	al, 3ah		;is it > 9 ? 如果0到9的数字, 那么我们就直接打印
	jl	printit		;jump if digit =0 to 9; 小鱼3ah那么我们就打印这个ascii吗.
	add	al,7h		;digit is A to F #否则我们假设现在输入的16进制数字是A,那么他表示10, 然而我们ascii码需要的是41H, 所以当前偏移量是 41H-30h-A=7h.

printit:
	mov	dl, al
	mov	ah, 2
	int	21h
	dec	ch
	jnz	rotate
	ret

main endp

program ends

	end