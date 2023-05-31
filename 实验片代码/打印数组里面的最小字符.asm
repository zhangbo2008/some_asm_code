assume cs:codesg,ds:data,ss:stack
data segmeNT
	str db 'hello world','$'
    str2 db '?','$'  ;$表示结束符.否则还会继续打印后续垃圾字符.
    str3 db '?????????'
data ends
stack segment
	db 10 dup (0) 
stack ends
codesg SEgment
	start:	
	mov ax,data
	mov ds,ax
	
	mov bx,0
	mov cx,11
	mov ah,0
	s:
		mov al,[bx]
		cmp ah,al
		jnb s1
		mov ah,al
	s1:
		;mov [bx],al
		inc bx
		loop s
		
		mov dx,offset str

;把ah里面数据给str2
mov bx,offset str2
mov [bx] , ah


;打印str2
		lea dx,str2		

		mov ah,9
		int 21H

		mov ah,4cH
		int 21H
codesg ends
end start















comment    *
c++
数组当中的最大值
int res=0
for(int i=0;i<str.size();i++)if(res<s[i])res=s[i];
return res

求最小值
int res=FF
for(int i=0;i<str.size();i++)if(res>s[i])res=s[i];
return res


for(int i=0;i<str.size();i++)str[i]转大写
* comment	
