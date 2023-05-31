TITLE HelloWorld

DATA SEGMENT
    DispTEXT           DB  10,'HelloWorld','$'      ;10是回车, 写完字符串后面加一个$表示字符串结尾.       
DATA ENDS

STACKS SEGMENT
    DW  80  DUP(?)      ;duplicate 80 times，prepare 80Byte for stacks
STACKS ENDS

.486
CODE    SEGMENT    USE16
        ASSUME      CS:CODE,DS:DATA,SS:STACKS
    BEG:
        ;Initialization
        MOV     AX,DATA     
        MOV     DS,AX

        ;where you can add your codes
        MOV     AH,09H
        LEA     DX,DispTEXT
        INT     21H

        ;Ending
        MOV     AX,4C00H
        INT     21H
CODE ENDS
        END BEG
