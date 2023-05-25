;－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
; by Loomman, QQ:28077188, MSN: Loomman@hotmail.com QQ裙：30515563
; Add1.asm
;－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
;有两个４字长（８字节）数分别存放在ＤＡＴＡ１和ＤＡＴＡ２
;请用８０８６指令求出他们的和，并把结果放在ＤＡＴＡ３

.model small

.data
	data1		dq	9999FFFFFFFFFFh     ; dq:64位.  右边的数16个每一个4位.所以也是64位.
	data2		dq	1h
	data3		dq	?

.code

start:
	mov	ax, @data
	mov	ds, ax           ;把data给ds

	clc                ;Clear Carry Flag
	lea	si, data1        ;lea register adress.
	lea	di, data2
	lea	bx, data3
	mov	cx, 4

back:
	mov	ax, [si]  ; 每次拷贝16个位.
	adc	ax, [di]  ;数据加上.
	mov	[bx], ax  ;放到bx里面.
	inc	si
	inc	si
	inc	di
	inc	di
	inc	bx
	inc	bx

	loop	back

	mov	ax, 4c00h ; debug断点到这里,运行完之后回车输入data3即可看结果是多少.
	int	21h

	end start