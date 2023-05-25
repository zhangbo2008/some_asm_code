assume cs:code,ds:data
;题目：编程实现将data段中每一个单词的头一个字母改为大写。
data segment
    db '1. file         '
	db '2. edit         '
	db '3. search       '
	db '4. view         '
	db '5. options      '
	db '6. help         '  ; 每一个长度都是16
data ends
 
code segment
    start:
	    mov ax,data
		mov ds,ax        ; 设置数据段
		mov cx,6         ; 共6行，循环6次
		mov bx,0         ; 偏移从0开始
		
	s:
        mov al,[bx+3]	 ; 读取当前行中第4列的字节到AL寄存器中
		and al,5FH       ; 进行And运算，转为大写字母，将结果放入AL寄存器中
		mov [bx+3],al    ; 将AL寄存器中的数据放入当前行中第4列的字节下
		add bx,16        ; 偏移加16，移到下一行
		loop s           ; 判断循环是否结束
		
		mov ax,4c00H
		int 21H
		
code ends
end start