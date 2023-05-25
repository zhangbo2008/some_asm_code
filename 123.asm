assume cs:code,ds:data,ss:stack
;题目：编程实现将data段中每一个单词都改为大写字母。
data segment
    db 'ibm             '
	db 'dec             '
	db 'doc             '
	db 'vax             '
data ends
 
stack segment
    dw 0,0,0,0,0,0,0,0
stack ends
 
code segment
    start:
	    mov ax,data
		mov ds,ax       ; 设置数据段
		mov ax,stack    
		mov ss,ax       ; 设置栈段
		mov sp,16       ; 设置栈底
		mov cx,4        ; 共4行，设置外层循环4次
		mov bx,0        ; 行偏移从0开始
		
	s:
        push cx          ; 将当前外层循环剩余次数入栈
		mov cx,3         ; 一行中共操作3个字节，设置内层循环3次
		mov si,0         ; 列偏移从0开始
	s1:
        mov al,[bx+si]   ; 读取一个字节的数据到AL寄存器中
        and al,5FH       ; 进行与运算，将其转成大写字母
        mov [bx+si],al   ; 将结果放到原字节内存地址处
        add si,1         ; 列偏移加1
        loop s1          ; 判断一行中的字母是否全部操作完毕
        
		pop cx		     ; 将当前外层循环次数出栈到CX寄存器中
		add bx,16        ; 行偏移加16，移到下一行
		loop s           ; 判断所有行是否操作完毕
		
		mov ax,4c00H
		int 21H
		
code ends
end start