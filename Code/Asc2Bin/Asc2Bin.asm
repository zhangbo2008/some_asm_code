;－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
; by Loomman, QQ:28077188, MSN: Loomman@hotmail.com QQ裙：30515563
; Asc2Bin.asm, 在MASM6.11环境下nmake编译链接，以支持栈参数
;－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
;把以ＡＳＣＩＩ形式表示的十进制数转换为二进制数
;设置为jsdos masm-v6.11来debug即可.
.model	small
.386
.stack 200h
.data
	ascval	db	'123456' ;起始offset是4.  前面是c2 04, 这里面c2对应的ascii是194. 模掉128之后是66.对应的ascii字母是B. 然后后面加一个4表示传输结束.然后加2个0打头,所以offset是4.
	binval	dw	?

.code
main proc               ;每一个进程用名字 proc开始 ,   名字endp结束.
start:
	mov	ax, @data  ; @表示取data的地址.
	mov	ds, ax  ; debug之后从这里开始.

	lea	bx, ascval ;把ascval对应的地址给bx
	push	bx				
	lea	bx, binval          				
	push	bx    ;仍进站里面然后进行函数调用.
	call	convascbin

	mov	ax, 4c00h
	int	21h
main	endp

convascbin proc pascal uses ax bx cx si di par1:word, par2:word   ;这行命令会自己添加push bp mov bp,sp  add sp -4  push ax
; 作用就是把当前对象保存在一个临时存储空间，它只能用到子程序或者FUNTION MODULE里，在程序结束的时候数据对象重新分配在临时空间的值。

; 如果用LOCAL对同一个对象执行了好几遍，那么只有第一次执行起作用。

; 语法：LOCAL dobj.
	local	asclen:word, mulfact:word
	mov	bx, 10
	mov	si, par1
	; bp为基址寄存器，一般在函数中用来保存进入函数时的sp的栈顶基址
; sp是栈顶指针，它每次指向栈顶。
	mov	di, par2
	sub	di, si
	mov	asclen, di ; 连个字符串相减得到第一个字符串长度.
	mov	cx, asclen 

	add	si, asclen
	dec	si
	mov	mulfact, 1
	mov	di, par2
	mov	[di], 0 ;结果写上0

next:
	mov	al, [si]    ;0位置的ascii写入al
	and	ax, 000fh
	mul	mulfact
	add	[di], ax  ;结果写入[di]里面.


	mov	ax, mulfact
	mul	bx
	mov	mulfact, ax   ;乘以十进制加回ax里面.
	dec	si
	loop	next
	ret
convascbin	endp

	end	start

