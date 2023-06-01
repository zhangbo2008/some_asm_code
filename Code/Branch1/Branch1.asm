;－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
; by Loomman, QQ:28077188, MSN: Loomman@hotmail.com QQ裙：30515563
; Branch1.asm
;－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
;跳跃表程序实现：
;根据ＡＬ寄存器中哪一位为１（从低位到高位）把程序转移到８个不同的分支中去; 打印宏.

;想实现一个打印变量的宏. 方便代码调试学习.打印数值的.
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





; 打印变量的偏移量. ;offset是16位的.
printintvar  MACRO     
	push di
	mov     ax,   offset branch_table[2]+30h    
	mov dl,al
    MOV     AH,2
    INT     21H
	pop di
    ENDM


; 打印变量的偏移量. ;offset是16位的.
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
	je	continue_main_line  ; 等于0就直接continue了.
	mov	si, 0

loop1:
	shr	al, 1   ;进行对al进行判断.
	jnb	not_yet
	jmp	branch_table[si]   ;数组里面的偏移量是按照字节来算的.

not_yet:
	add	si, type branch_table ; type可以打印数组里面的每一个元素占用的字节数.这个项目里面是2.
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