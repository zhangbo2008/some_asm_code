DATAS SEGMENT
    ;后面以0dh,0ah,'$'结尾表示换行
    string db  'Hello, Assembly! ', 0dh, 0ah, '$'
DATAS ENDS
 
STACKS SEGMENT
    ;此处输入堆栈段代码
STACKS ENDS
 
CODES SEGMENT
    ASSUME CS:CODES,DS:DATAS,SS:STACKS
START:
	MOV AX,DATAS
    MOV DS,AX
    MOV DX,OFFSET string    ;打印字符串提示信息
    MOV AH,09H    ;调用9号中断
    INT 21H
    MOV AX,4C00H
    INT 21h
CODES ENDS
	END START