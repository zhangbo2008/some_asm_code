;��������������������������������������������������������������������
; by Loomman, QQ:28077188, MSN: Loomman@hotmail.com QQȹ��30515563
; BiniHex.asm
;��������������������������������������������������������������������
;��������������������ת������
;������ѣ£ؼĴ����ڵģ��������ã������Ƶ���ʽ����Ļ����ʾ����
;  tasm/masm ���ѡ��jsdos masm-v6.11 û��ͼ�ν�����debug. ֻ�ܵ�����...
;������˼����Ŀ, ascii����ĺ�����˼!!!!!!!!!!
program segment

main proc far
	assume cs:program
start:
	;set up stack for return
	push	ds
	sub	ax, ax
	push	ax

	;main part of prognam
	mov	bx, 00111B ; ��������������Ƶ�����. ��B��β.����������������ɶ����, �ڴ��ж����Զ�ת��Ϊ16�������洢.

	mov	ch, 4		;number of digits   ;������������16������4���ַ�. ������ת4��.
rotate:
	mov	cl, 4		;set count to 4 bits
	rol	bx, cl		;left digit to right
	mov	al, bl		;mov to al
	and	al, 0fh		;mask off left digit
	add	al, 30h		;convert hex to ASC2 #16����ת��Ϊasc��.  ������������0, 0��ascii����30.����������ط�Ҫal��30h����. 
	cmp	al, 3ah		;is it > 9 ? ���0��9������, ��ô���Ǿ�ֱ�Ӵ�ӡ
	jl	printit		;jump if digit =0 to 9; С��3ah��ô���Ǿʹ�ӡ���ascii��.
	add	al,7h		;digit is A to F #�������Ǽ������������16����������A,��ô����ʾ10, Ȼ������ascii����Ҫ����41H, ���Ե�ǰƫ������ 41H-30h-A=7h.

printit:
	mov	dl, al
	mov	ah, 2
	int	21h
	dec	ch
	jnz	rotate
	ret

main endp

program ends

	end