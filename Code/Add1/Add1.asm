;��������������������������������������������������������������������
; by Loomman, QQ:28077188, MSN: Loomman@hotmail.com QQȹ��30515563
; Add1.asm
;��������������������������������������������������������������������
;���������ֳ������ֽڣ����ֱ����ڣģ��ԣ����ͣģ��ԣ���
;���ã�������ָ��������ǵĺͣ����ѽ�����ڣģ��ԣ���

.model small

.data
	data1		dq	9999FFFFFFFFFFh     ; dq:64λ.  �ұߵ���16��ÿһ��4λ.����Ҳ��64λ.
	data2		dq	1h
	data3		dq	?

.code

start:
	mov	ax, @data
	mov	ds, ax           ;��data��ds

	clc                ;Clear Carry Flag
	lea	si, data1        ;lea register adress.
	lea	di, data2
	lea	bx, data3
	mov	cx, 4

back:
	mov	ax, [si]  ; ÿ�ο���16��λ.
	adc	ax, [di]  ;���ݼ���.
	mov	[bx], ax  ;�ŵ�bx����.
	inc	si
	inc	si
	inc	di
	inc	di
	inc	bx
	inc	bx

	loop	back

	mov	ax, 4c00h ; debug�ϵ㵽����,������֮��س�����data3���ɿ�����Ƕ���.
	int	21h

	end start