assume cs:code
 ; 代码效果把第一个dw里面数据进行逆序排列.
code segment
    dw 0123H,0456H,0789H,0abcH,0defH,0fedH,0cbaH,0987H; debug模式下.右键goto;输入cs:0即可看到这些数据. 注意顺序是从大刀小的地址排列:也就是cs:0000 2301
	dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0    ;我们一共要操作8个数,那么栈空间就开16个.2倍来保证空间够.因为还有一些垃圾数据会自动放站里面.
    ;设置2个数组. dw:data word 每一个是16位所以叫word.  第二个dw是辅助空间, 多开一点,一般开上面的dw2倍才够.            我们第一个栈是这个16个数据,也就是20H,  他后面再放8个word,所以整个栈空间是30H.               栈顶是0, 这个是永远不变的!!!!!!!
start:
    mov ax,cs
	mov ss,ax      ;栈低设置为cs
	mov sp,30H      ;栈顶  #########下面我们分析为什么要设置sp为30. sp为栈底也就是栈的偏移量最大值., 首先cs里面我们存第一个dw部分, 是8个word.所以是16位用完了. 下面是16个word. 所以我们用了32位. 所以我们总共就是30H.!!!!!!!!
	
	mov bx,0
	mov cx,8
  s:push cs:[bx]  ; 从30H压入8个word,所以sp到20H了.  2301放到了cs:2e  ;!!!!!!!!!!!!!!!!想
    add bx,2
    loop s
	
	mov bx,0
	mov cx,8
 s0:pop cs:[bx]	;栈pop输出,然后把pop的东西放到cs:[bx]位置.
    add bx,2
	loop s0
	
	mov ax,4c00H
	int 21H
code ends
end start 