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
printfunc:

	


   ret  
main proc far

start:
	;set up stack for return

	; printint
	; printintvar2
mov ax ,20
push ax
call printfunc







	push	ds
	sub	ax, ax
	push	ax

	mov	ax, data
	mov	ds, ax

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
		
routine_2:

routine_3:

routine_4:

routine_5:

routine_6:

routine_7:

routine_8:

	ret
main endp

code ends

	end start