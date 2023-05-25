assume cs:code,ds:data,ss:stack          ; 定义代码段，标号为code；定义数据段，标号为data；定义栈段，标号为stack
 
data segment                             ; 数据段开始
    dw 0123H,0456H,0789H,0abcH,0defH,0fedH,0cbaH,0987H
data ends                                ; 数据段结束
 
stack segment                            ; 栈段开始
    dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
stack ends                               ; 栈段结束
 
code segment                             ; 代码段开始
start:                                   ; 程序开始
    mov ax,data                ;把data地址给ds赋值.
	mov ds,ax                            ; 设置ds为定义的数据段
	mov ax,stack
	mov ss,ax                            ; 设置ss为定义的栈段, 栈低设置为stack的地址.
	mov sp,20H                           ; 设置sp指向栈底; 我们分析为什么栈低是20H. 首先我们ss数据就是第八行的地址了. 我们栈里面一共有16个word.所以我们用了32位, 所以是20H.证毕.汇编麻烦的地方就是栈里面的地址都需要自己计算!
	
	mov bx,0                             ; 数据段偏移从0开始
	mov cx,8                             ; 循环8次
  s:push ds:[bx]                         ; 将数据段中指定偏移下的字字型数据入栈
    add bx,2                             ; 字型数据长度2个字节，所以偏移加2
    loop s                               ; 判断循环
	                                     ; 第二次循环开始
	mov bx,0                             ; 数据段偏移从0开始
	mov cx,8                             ; 循环8次
 s0:pop ds:[bx]	                         ; 将栈中的数据出栈放到数据段中指定偏移下
    add bx,2                             ; 偏移加2
	loop s0                              ; 判断循环
	
	mov ax,4c00H
	int 21H                              ; 程序返回
code ends                                ; 代码段结束
end start                                ; 源程序结束，并指定程序开始位置