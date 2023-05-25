assume cs:code,ds:data
 
data segment
    db 'welcome to masm!'  ; 每一个b大小是8位.
    db '................'
data ends
 
code segment
start:
        mov ax,data
        mov ds,ax
		mov si,0
		mov di,16
		mov cx,8     ; 循环8次
		
	  s:mov ax,[si]  ; 从复制源地址取出一个字放入ax寄存器中; ax寄存器是16位的.
        mov [di],ax  ; 将ax寄存器中的数据写入复制目的地址下
        add si,2     ; 复制源地址的偏移加2
        add di,2     ; 复制目的地址的偏移加2
        loop s	
      
        mov ax,4c00H
        int 21H		
code ends
 
end start