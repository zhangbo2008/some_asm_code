;数据是反着放的. 小位置地址小,也就是12345
;在内存里面放的顺序是54321. 
;查看变量的方法是先按回车,然后输入你要查询的寄存器或者变量的名字. 更好的方法是.左下角watches里面右键之后选择watch,然后输入你要查看的变量名. 比如si, di , [si], [di]都可以.   这个代码里面lea	si, data1
;表示的含义是把data1的地址给si, [si]表示的是si的地址里面的数值. []就是c语言里面的根据地址取内容的意思.
根据这个代码可以很好的学习汇编的语法规则.# some_asm_code
# some_asm_code



	int指令表:

		https://blog.csdn.net/guoyingming123/article/details/5581244