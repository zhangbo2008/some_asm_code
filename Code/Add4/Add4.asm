;－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
; by Loomman, QQ:28077188, MSN: Loomman@hotmail.com QQ裙：30515563
; Add4.asm
;－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－
;有两个４字长（８字节）数分别存放在ＤＡＴＡ１和ＤＡＴＡ２
;请用８０８６指令求出他们的和，并把结果放在ＤＡＴＡ３

.model small
.386
.stack 200h
.data
	data1		dq	9FFFFFFFFFh
	data2		dq	1h
	data3		dq	?

.code

start:
	mov	ax, @data
	mov	ds, ax

	mov	eax, dword ptr data1  ; 吧data1地址里面的数据给eax
	add	eax, dword ptr data2
	mov	edx, dword ptr data1+4
	adc	edx, dword ptr data2+4
	mov	dword ptr data3, eax
	mov	dword ptr data3+4, edx ;贼他妈神奇,分开2个部分加,然后进位自动保持了..........

	mov	ax, 4c00h
	int	21h

	end start