;��������������������������������������������������������������������
; by Loomman, QQ:28077188, MSN: Loomman@hotmail.com QQȹ��30515563
; Asc2Bin.asm, ��MASM6.11������nmake�������ӣ���֧��ջ����
;��������������������������������������������������������������������
;���ԣ��ӣãɣ���ʽ��ʾ��ʮ������ת��Ϊ��������
;����Ϊjsdos masm-v6.11��debug����.
.model	small
.386
.stack 200h
.data
	ascval	db	'123456' ;��ʼoffset��4.  ǰ����c2 04, ������c2��Ӧ��ascii��194. ģ��128֮����66.��Ӧ��ascii��ĸ��B. Ȼ������һ��4��ʾ�������.Ȼ���2��0��ͷ,����offset��4.
	binval	dw	?

.code
main proc               ;ÿһ������������ proc��ʼ ,   ����endp����.
start:
	mov	ax, @data  ; @��ʾȡdata�ĵ�ַ.
	mov	ds, ax  ; debug֮������￪ʼ.

	lea	bx, ascval ;��ascval��Ӧ�ĵ�ַ��bx
	push	bx				
	lea	bx, binval          				
	push	bx    ;�Խ�վ����Ȼ����к�������.
	call	convascbin

	mov	ax, 4c00h
	int	21h
main	endp

convascbin proc pascal uses ax bx cx si di par1:word, par2:word   ;����������Լ����push bp mov bp,sp  add sp -4  push ax
; ���þ��ǰѵ�ǰ���󱣴���һ����ʱ�洢�ռ䣬��ֻ���õ��ӳ������FUNTION MODULE��ڳ��������ʱ�����ݶ������·�������ʱ�ռ��ֵ��

; �����LOCAL��ͬһ������ִ���˺ü��飬��ôֻ�е�һ��ִ�������á�

; �﷨��LOCAL dobj.
	local	asclen:word, mulfact:word
	mov	bx, 10
	mov	si, par1
	; bpΪ��ַ�Ĵ�����һ���ں���������������뺯��ʱ��sp��ջ����ַ
; sp��ջ��ָ�룬��ÿ��ָ��ջ����
	mov	di, par2
	sub	di, si
	mov	asclen, di ; �����ַ�������õ���һ���ַ�������.
	mov	cx, asclen 

	add	si, asclen
	dec	si
	mov	mulfact, 1
	mov	di, par2
	mov	[di], 0 ;���д��0

next:
	mov	al, [si]    ;0λ�õ�asciiд��al
	and	ax, 000fh
	mul	mulfact
	add	[di], ax  ;���д��[di]����.


	mov	ax, mulfact
	mul	bx
	mov	mulfact, ax   ;����ʮ���Ƽӻ�ax����.
	dec	si
	loop	next
	ret
convascbin	endp

	end	start

