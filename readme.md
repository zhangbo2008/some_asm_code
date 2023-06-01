;数据是反着放的. 小位置地址小,也就是12345
;在内存里面放的顺序是54321. 
;查看变量的方法是先按回车,然后输入你要查询的寄存器或者变量的名字. 更好的方法是.左下角watches里面右键之后选择watch,然后输入你要查看的变量名. 比如si, di , [si], [di]都可以.   这个代码里面lea	si, data1
;表示的含义是把data1的地址给si, [si]表示的是si的地址里面的数值. []就是c语言里面的根据地址取内容的意思.
根据这个代码可以很好的学习汇编的语法规则.# some_asm_code
# some_asm_code



	int指令表:

		https://blog.csdn.net/guoyingming123/article/details/5581244



打印小工具代码:
想打印什么就把2h改成什么即可.然后把这个代码放到你想打印的位置.
	push di
	push ax
	mov     dl, 2h+30h
    MOV     AH,2
    INT     21H
	pop ax
	pop di

	具体使用还是有些复杂:下面写点例子:
	1.打印al值.
	push di
	push ax
	add ax , 30h
	mov     dl, al
    MOV     AH,2
    INT     21H
	pop ax
	pop di
	1.1打印ah值:
	push di
	push ax
	add ax , 3000h
	mov     dl, ah
    MOV     AH,2
    INT     21H
	pop ax
	pop di
	1.2打印ax值.
	push di
	push ax
	add ax , 30h
	mov     dl, al
    MOV     AH,2
    INT     21H
	pop ax
	pop di
	push di
	push ax
	add ax , 3000h
	mov     dl, ah
    MOV     AH,2
    INT     21H
	pop ax
	pop di
	2.打印bl值
	push di
	push ax
	add bx , 30h
	mov     dl, bl
    MOV     AH,2
    INT     21H
	pop ax
	pop di
	3.打印cl值
	push di
	push ax
	add cx , 30h
	mov     dl, cl
    MOV     AH,2
    INT     21H
	pop ax
	pop di
	4.打印offset data的低8位.
	push di
	push ax
	mov  ax , offset data+30h
	mov     dl, al
    MOV     AH,2
    INT     21H
	pop ax
	pop di