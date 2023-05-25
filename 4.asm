assume cs:code,ds:data
 
data segment
    db 'BaSiC'
	db 'MinIX'
data ends
 
code segment
start:
    mov ax,data
	mov ds,ax
	mov bx,0
	mov cx,5
	
  s:mov al,[bx]      ; 取第一个字符串中的字符到AL寄存器中
    and al,5fH       ; 将英文字符转为大写
	mov [bx],al      ; 将大写后的英文字符放到原地址下
	
	mov al,[bx+5]    ; 当前偏移bx加5，取到第二个字符串中的字符到AL寄存器中
	or al,20H        ; 将英文字符转为小写
	mov [bx+5],al    ; 将小写后的英文字符放到原地址下
    
	add bx,1         ; 可变偏移bx加1
	loop s           ; 判断循环是否结束
  
	mov ax,4c00H
	int 21H
code ends
end start