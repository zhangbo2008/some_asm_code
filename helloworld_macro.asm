TITLE HelloWorld(withMACRO)

;define a macro
DISPhw  MACRO
    MOV     AH,09H
    LEA     DX,DispTEXT
    INT     21H
    ENDM

DATA SEGMENT
    DispTEXT           DB  10,'HelloWorld','$'            
DATA ENDS

STACKS SEGMENT
    DW  80  DUP(?)      ;duplicate 80 times，prepare 80Byte for stacks
STACKS ENDS

CODE    SEGMENT 
        ASSUME      CS:CODE,DS:DATA,SS:STACKS
    BEG:
        ;Initialization
        MOV     AX,DATA     
        MOV     DS,AX

        ;where you can add your codes
        DISPhw

        ;Ending
        MOV     AX,4C00H
        INT     21H
CODE ENDS
        END BEG
