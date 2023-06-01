assume cs:code
; 记忆点:  1.主函数, 子函数都需要自己维护bp和sp(当然不维护也行,但是非常容易出bug,所以还是要强烈按照下面子函数头,子函数尾.主函数头尾这么写,最安全.)  2. 函数ip都有压栈出站自动维护但是自己要算明白栈的偏移量.
code segment
    radd proc
        push bp           ;子函数的头部固定写法
        mov bp,sp

        mov si,[bp+4]
        mov di,[bp+6]
        add si,di
        mov ax,si

        pop bp           ;子函数的尾部固定写法.
        ; 打印返回值:
                add al, 30h
                mov dl , al
                MOV     AH,2
                INT     21H
        ret
    radd endp
start:
    mov ax,4
    mov bx,5



    push ax  ;主函数头
    push bx               ;主函数头
    call radd
    add sp,4                      ;主函数尾清理栈.

   

 





    mov ax,4c00h
    int 21h
code ends
end start