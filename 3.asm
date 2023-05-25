assume cs:code,ds:data    ; 定义代码段、数据段; 写给编译器的.必须写.
 
data segment              ; 数据段开始
    db 'BaSiC'            ; 申请内存空间并初始化第一条字符串
	db 'MinIX'            ; 申请内存空间并初始化第二条字符串
data ends                 ; 数据段结束
 
code segment              ; 代码段开始
start:                    ; 程序指令开始
    mov ax,data           
	mov ds,ax             ; 设置数据段
	mov bx,0              ; 偏移从0开始
    mov cx,5              ; 循环5次
	
  s:mov al,[bx]           ; 取一个英文字符到AL寄存器中
    and al,5fH            ; 将英文字符转为大写
	mov [bx],al           ; 将大写后英文字符放入原地址下
    add bx,1              ; 偏移加1
	loop s                ; 判断循环是否结束
    
    mov cx,5              ; 循环5次
 s1:mov al,[bx]           ; 取一个英文字符到AL寄存器中
    or al,20H             ; 将英文字符转为小写
    mov [bx],al           ; 讲小写后英文字符放入原地址下
	add bx,1              ; 偏移加1
	loop s1               ; 判断循环是否结束
	
	mov ax,4c00H ;结束程序,返回dos系统.
	int 21H               ; 程序返回
code ends                 ; 代码段结束
end start                 ; 源程序结束，并标明程序入口