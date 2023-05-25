assume cs:code,ds:data
 
data segment
    db '11111111'
    db '22222222'
    db '33333333'
data ends
 
code segment
    start:
	    mov ax,data
		mov ds,ax         ; 设置数据段
		mov bx,0          ; 行偏移从0开始
		mov ax,0          ; 列偏移从0开始
		
		mov cx,3          ; 设置外层循环为3次（共3行）




	  s:mov si,0          ; 每一行中列的偏移从0开始
	    mov di,cx         ; 保存当前外层循环剩余的循环次数（重要！）
	    mov cx,8          ; 设置内层循环为8次（共8列）
        s1:mov al,[bx+si]    ; 读取一个字节的数据到AL寄存器中
            add si,1          ; 列偏移加1
            loop s1           ; 判断内层循环是否结束
        add bx,8          ; 行偏移加8，移到下一行开始
        mov cx,di         ; 还原外层循环的当前循环次数
        loop s		      ; 判断外层循环是否结束
		







        
		mov ax,4c00H
		int 21H
code ends
end start