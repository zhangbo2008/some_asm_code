;��������������������������������������������������������������������
; by Loomman, QQ:28077188, MSN: Loomman@hotmail.com QQȹ��30515563
; Branch1.asm
;��������������������������������������������������������������������
;��Ծ�����ʵ�֣�
;���ݣ��̼Ĵ�������һλΪ�����ӵ�λ����λ���ѳ���ת�Ƶ�������ͬ�ķ�֧��ȥ; ��ӡ��.

;��ʵ��һ����ӡ�����ĺ�. ����������ѧϰ.��ӡ��ֵ��.
printint  MACRO     
	push di
		mov     dl, 2h+30h
    MOV     AH,2
    INT     21H
	pop di
    ENDM





data segment
	branch_table	dw	routine_1
			dw	routine_2
			dw	routine_3
			dw	routine_4
			dw	routine_5
			dw	routine_6
			dw	routine_7
			dw	routine_8
data ends





; ��ӡ������ƫ����. ;offset��16λ��.
printintvar  MACRO     
	push di
	mov     ax,   offset branch_table[2]+30h    
	mov dl,al
    MOV     AH,2
    INT     21H
	pop di
    ENDM


; ��ӡ������ƫ����. ;offset��16λ��.
printintvar2  MACRO     
	push di
	mov     ax,   type branch_table   +30h    
	mov dl,al
    MOV     AH,2
    INT     21H
	pop di
    ENDM





code segment
	assume cs:code, ds:data

main proc far

start:
	;set up stack for return

	; printint
	; printintvar2
	push di
	push ax
	mov  ax , offset data+3000h
	mov     dl, al
    MOV     AH,2
    INT     21H
	pop ax
	pop di
	push di
	push ax
	mov  ax , offset data+30h
	mov     dl, al
    MOV     AH,2
    INT     21H
	pop ax
	pop di

















	push	ds
	sub	ax, ax
	push	ax

	mov	ax, data
	mov	ds, ax
	mov al ,1111B
	cmp	al, 0
	je	continue_main_line  ; ����0��ֱ��continue��.
	mov	si, 0

loop1:
	shr	al, 1   ;���ж�al�����ж�.
	jnb	not_yet
	jmp	branch_table[si]   ;���������ƫ�����ǰ����ֽ������.

not_yet:
	add	si, type branch_table ; type���Դ�ӡ���������ÿһ��Ԫ��ռ�õ��ֽ���.�����Ŀ������2.
	jmp	loop1

continue_main_line:

routine_1:
		push di
	push ax
	mov     dl, 1h+30h
    MOV     AH,2
    INT     21H
	pop ax
	pop di
routine_2:
push di
		mov     dl, 2h+30h
    MOV     AH,2
    INT     21H
	pop di
routine_3:
push di
		mov     dl, 3h+30h
    MOV     AH,2
    INT     21H
	pop di
routine_4:
push di
		mov     dl, 4h+30h
    MOV     AH,2
    INT     21H
	pop di
routine_5:
push di
		mov     dl, 5h+30h
    MOV     AH,2
    INT     21H
	pop di
routine_6:
push di
		mov     dl, 6h+30h
    MOV     AH,2
    INT     21H
	pop di
routine_7:
push di
		mov     dl, 7h+30h
    MOV     AH,2
    INT     21H
	pop di
routine_8:
push di
		mov     dl, 8h+30h
    MOV     AH,2
    INT     21H
	pop di
	ret
main endp

code ends

	end start