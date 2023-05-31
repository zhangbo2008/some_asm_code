TITLE BUBBLESORT

;==============================================DATAsegment============================================================================================
DATA SEGMENT
    numbers                 DB  78,23,-12,0,-2,99,-11,-67,9,56,44       ;11 numbers
DATA ENDS
;=================================================STACKS SEGMENT=======================================================================
STACKS SEGMENT
    DW  128  DUP(?)      ;duplicate 128 times，准备128Byte的空间
STACKS ENDS

;===================================================CODE SEGMENT=======================================================================
.486
CODE SEGMENT    USE16
        ASSUME      CS:CODE,DS:DATA
    BEG:
        ;Initialization
        MOV     AX,DATA     
        MOV     DS,AX
    A10MAIN     PROC    NEAR
        CALL    A11BUBBLESORT   
        CALL    A12DISPLAY            
        A10end:
        MOV     AX,4C00H
        INT     21H
    A10MAIN     ENDP

    ;===========================================PART1.BUBBLESORT=================================================================================
    A11BUBBLESORT  PROC    NEAR
        MOV     CX,10 ;记录外循环的次数

        L1:
        MOV     DI,CX ;记录当前内循环的次数
        MOV     BX,0 ; 记录当前比较的数字的位置
        L2:
        MOV     AL,numbers[BX]
        CMP     AL,numbers[BX+1]
        JGE     NEXT1
        XCHG    AL,numbers[BX+1]
        MOV     numbers[BX],AL
        NEXT1:
        INC     BX
        DEC     DI
        CMP     DI,0
        JNE     L2
        LOOP    L1 
        RET
    A11BUBBLESORT  ENDP 

    ;===========================================PART2.DISPLAY=================================================================================
    A12DISPLAY     PROC    NEAR
        MOV     CX,11
        MOV     SI,0
        Ldisp:
        MOV     BX,10
        PUSH    BX
        MOV     AX,0
        MOV     AL,numbers[SI] 
        TEST    AL,10000000B
        JZ      LTRANSFORM       ;非负数
        PUSH    AX
        MOV     AH,02H
        MOV     DL,'-'
        INT     21H
        POP     AX
        NEG     AL
        LTRANSFORM:     ;转换数字
        MOV     DX,0
        DIV     BX      ;DX,AX/BX = 商：AX，余数：DX
        PUSH    DX        
        CMP     AX,0
        JNE     LTRANSFORM
        DISP:
        POP     DX
        CMP     DX,BX
        JE      NEXTNUM   ;NEXT NUMBER
        MOV     AH,02H
        ADD     DL,30H
        INT     21H
        JMP     DISP
        NEXTNUM:
        CMP     SI,9
        JA      NEXT3
        MOV     AH,02H
        MOV     DL,','
        INT     21H
        NEXT3:
        INC     SI
        LOOP    Ldisp

        RET
    A12DISPLAY     ENDP
    
CODE ENDS
        END BEG
