TITLE HelloWorld(withPROC)

DATA SEGMENT
    DispTEXT           DB  10,'HelloWorld','$'            
DATA ENDS

STACKS SEGMENT
    DW  80  DUP(?)      ;duplicate 80 times，prepare 80Byte for stacks
STACKS ENDS            ; 栈开辟80个位置 ?表示空白.

CODE    SEGMENT 
        ASSUME      CS:CODE,DS:DATA,SS:STACKS; 这3个也是必须写. 
    BEG:
        ;Initialization
        MOV     AX,DATA     
        MOV     DS,AX

        ;where you can add your codes
        CALL    A10DISP     ;call A10DISP to display "HelloWorld"
;过程的命名一般以A10xxx，B10xxx等命名，便于分类整理；  A10DISP是我们自己定义的函数名.
        ;Ending
        MOV     AX,4C00H
        INT     21H

    ;define a process
    A10DISP     PROC    NEAR
        MOV     AH,09H ;mov ah 09h int 21h 是实现DOS调用中的09号功能，就是在屏幕上显示字符串
        LEA     DX,DispTEXT   ;lea吧disptext的地址给dx
        INT     21H   ;21h 配合ah,dx来显示字符串.
        RET
    A10DISP     ENDP
CODE ENDS
        END BEG
