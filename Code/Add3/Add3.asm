;��������������������������������������������������������������������
; by Loomman, QQ:28077188, MSN: Loomman@hotmail.com QQȹ��30515563
; Add3.asm
;��������������������������������������������������������������������
;���������ֳ������ֽڣ����ֱ����ڣģ��ԣ����ͣģ��ԣ���
;���ã�������ָ��������ǵĺͣ����ѽ�����ڣģ��ԣ���

.model small
.386
.data
	data1		dq	123456789abcdefh
	data2		dq	0fedcba987654321h
	data3		dq	?

.code

start:
	mov	ax, @data
	mov	ds, ax

	clc
	lea	si, data1
	lea	di, data2
	lea	bx, data3
	mov	cx, 2

back:
	mov	eax, [si]
	adc	eax, [di]
	mov	[bx], eax
	pushf  ;��eflag����ջ
	add	si, 4
	add	di, 4
	add	bx, 4
	popf  ;��ջ������efalgs
;�����Ƿ��ŷŵ�. Сλ�õ�ַС,Ҳ����12345
;���ڴ�����ŵ�˳����54321. 
;�鿴�����ķ������Ȱ��س�,Ȼ��������Ҫ��ѯ�ļĴ������߱���������. ���õķ�����.���½�watches�����Ҽ�֮��ѡ��watch,Ȼ��������Ҫ�鿴�ı�����. ����si, di , [si], [di]������.   �����������lea	si, data1
;��ʾ�ĺ����ǰ�data1�ĵ�ַ��si, [si]��ʾ����si�ĵ�ַ�������ֵ. []����c��������ĸ��ݵ�ַȡ���ݵ���˼.
	loop	back

	mov	ax, 4c00h
	int	21h

	end start