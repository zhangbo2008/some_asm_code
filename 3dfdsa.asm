assume cs:code,ds:data,ss:stack
 
data segment
    db '1. file         '
	db '2. edit         '
	db '3. search       '
	db '4. view         '
	db '5. options      '
	db '6. help         '
data ends
 
stack segment
    dw 0,0,0,0,0,0,0,0
stack ends
 
code segment
    start:
	    mov ax,data
		mov ds,ax
		mov bx,0              ; 设置行的起始偏移为0
		mov cx,6
		
	s:
	    push cx
		mov cx,4
		mov si,0
	s1:	
        mov al,ds:[bx+si+3]   ; 偏移再加上3，确定列的起始偏移
		and al,5FH
		mov ds:[bx+si+3],al
		add si,1
		loop s1
		
		pop cx
		add bx,16
		loop s
		
	mov ax,4c00H
	int 21H
code ends
end start