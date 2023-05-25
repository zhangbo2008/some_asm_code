assume cs:code,ds:data
 
data segment
    db 'welcome to masm!'
    db '................'
data ends
 
code segment
start:
        mov ax,data
        mov ds,ax
		mov bx,0        ; 偏移从0开始
		mov cx,8        ; 循环8次
		
	  s:mov ax,[bx]     ; 取当前偏移下的一个字数据放到ax寄存器中
        mov [bx+16],ax  ; 将ax寄存器中的数据写入当前偏移加上16个字节处的内存地址下
        add bx,2        ; 当前偏移加2
        loop s	
      
        mov ax,4c00H
        int 21H		
code ends
 
end start