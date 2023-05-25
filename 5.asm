assume cs:code,ds:data      ; 定义代码段、数据段
 
data segment                ; 数据段开始
    db 'welcome to masm!'   ; 申请16个字节空间，初始值为“welcome to masm!”
    db '................'   ; 申请16个字节空间
data ends                   ; 数据段结束
 
code segment                ; 代码段开始
start:                      ; 程序开始　　　
        mov ax,data         ; 
        mov ds,ax           ; 设置数据段
		mov si,0            ; 复制源的数据偏移从0开始
		mov di,16           ; 复制的目的地址数据偏移从16开始
		mov cx,16           ; 循环16次
		
	  s:mov al,[si]         ; 从复制源地址取出一个字节放入al寄存器中
        mov [di],al         ; 将al寄存器中的数据写入复制目的地址下#从0-->15 复制到16->31
        add si,1            ; 复制源地址的偏移加1
        add di,1            ; 复制目的地址的偏移加1
        loop s	            ; 判断循环是否结束
      
        mov ax,4c00H
        int 21H		        ; 程序返回
code ends                   ; 代码段结束
 
end start                   ; 源程序结束，并指明程序入口地址