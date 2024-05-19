[org 0x0100]

jmp start
temp: db'Temp'
length: dw 4
speed: db'rpm'
length1: dw 3
rm1: dw 1199,1203,1
rm2: dw 1517,1525,3
rm3: dw 2317,2325,4
tickcount: dd 0              ;timer
tc: dd 0
fr: dw 00,00
end: dw 0
oldisr: dd 0

;-------------------------------------------------------------start-----------------------------------------------------------;

line:

  mov bp,sp
  push ax
  push es
  push cx
  push si
  push di
  push bx
  push dx
  mov cx,2
  mov ax,0xb800
  mov es,ax
  mov di,[bp+4]
  mov bx,[bp+4]
  mov si,[bp+2]
  mov dx,[bp+2]
l:
  mov word[es:di],0x37db
  add di,2
  cmp di,si
  jne l
  pop dx
  pop bx
  pop di
  pop si
  pop cx
  pop es
  pop ax
  ret

des:

  mov bp,sp
  push ax
  push es
  push cx
  push si
  push di
  push bx
  push dx
  mov cx,2
  mov ax,0xb800
  mov es,ax
  mov di,[bp+4]
  mov bx,[bp+4]
  mov si,[bp+2]
  mov dx,[bp+2]
d:
  mov word[es:di],0x0f27
  add di,2
  cmp di,si
  jne d
  pop dx
  pop bx
  pop di
  pop si
  pop cx
  pop es
  pop ax
  ret 4

red:

  mov bp,sp
  push ax
  push es
  push cx
  push si
  push di
  push bx
  push dx
  mov cx,2
  mov ax,0xb800
  mov es,ax
  mov di,[bp+4]
  mov bx,[bp+4]
  mov si,[bp+2]
  mov dx,[bp+2]
r_e_d:
  mov word[es:di],0x34db
  add di,2
  cmp di,si
  jne r_e_d
  pop dx
  pop bx
  pop di
  pop si
  pop cx
  pop es
  pop ax
  ret 4

green:

  mov bp,sp
  push ax
  push es
  push cx
  push si
  push di
  push bx
  push dx
  mov cx,2
  mov ax,0xb800
  mov es,ax
  mov di,[bp+4]
  mov bx,[bp+4]
  mov si,[bp+2]
  mov dx,[bp+2]
g_r_e_e_n:
  mov word[es:di],0x32db
  add di,2
  cmp di,si
  jne g_r_e_e_n
  pop dx
  pop bx
  pop di
  pop si
  pop cx
  pop es
  pop ax
  ret 4

black:

  mov bp,sp  
  push ax
  push es
  push cx
  push si 
  push di
  push bx
  push dx
  mov cx,2
  mov ax,0xb800
  mov es,ax
  mov di,[bp+4]
  mov bx,[bp+4]
  mov si,[bp+2]
  mov dx,[bp+2]
b:
  mov word[es:di],0x0000
  add di,2
  cmp di,si
  jne b
  pop dx
  pop bx
  pop di
  pop si
  pop cx
  pop es
  pop ax
   ret 4

printstr:

  push bp  
  mov bp, sp
  push es
  push ax
  push cx
  push si
  push di
  mov ax, 0xb800
  mov es, ax ; point es to video base
  mov al, 80 ; load al with columns per row
  mul byte [bp+10] ; multiply with y position
  add ax, [bp+12] ; add x position
  shl ax, 1 ; turn into byte offset
  mov di,ax ; point di to required location
  mov si, [bp+6] ; point si to string
  mov cx, [bp+4] ; load length of string in cx
  mov ah, [bp+8] ; load attribute in ah
  nextchar: mov al, [si] ; load next char of string
  mov [es:di], ax ; show this char on screen
  add di, 2
  add si, 1 ; move to next char in string
  loop nextchar ; repeat the operation cx times
  pop di
  pop si
  pop cx
  pop ax
  pop es
  pop bp
  ret 10

;-------------------------------------------------------------sky-----------------------------------------------------------;

sky:      
        
  mov bp,sp               
  push ax 
  push es
  push cx
  push si
  push di
  mov ax,0xb800
  mov es,ax
  mov di,0
s:
  mov word[es:di],0x0bdb       ;color  
  add di,2
  cmp di ,1120            
  jne s
  pop di         
  pop si
  pop cx
  pop es
  pop ax
  ret 

;-------------------------------------------------------------Dashboard-----------------------------------------------------------;

dashboard:
            
  mov bp,sp
  push ax
  push es
  push cx
  push si
  push di
  mov ax,0xb800
  mov es,ax  
  mov di,3040
color:
  mov word[es:di],0x26db   
  add di,2
  cmp di ,4000            ;checks if di has reached the end      
  jne color
  pop di
  pop si
  pop cx
  pop es
  pop ax
  ret 

;-------------------------------------------------------------BackMirrors-----------------------------------------------------------;

backmirrors:

push es
push ax
mov ax,0xb800
mov es,ax

rightbackmirror:

mov word[es:3344],0xffff
mov word[es:3346],0xffff
mov word[es:3348],0xffff
mov word[es:3350],0xffff
mov word[es:3352],0x22db
mov word[es:3354],0x22db
mov word[es:3356],0x22db
mov word[es:3358],0x22db
mov word[es:3504],0xffff
mov word[es:3506],0xffff
mov word[es:3508],0xffff
mov word[es:3510],0xffff
mov word[es:3512],0xffff
mov word[es:3514],0x22db
mov word[es:3516],0x22db
mov word[es:3518],0x22db

leftbackmirror:

mov word[es:3200],0x22db
mov word[es:3202],0x22db
mov word[es:3204],0x22db
mov word[es:3206],0x22db
mov word[es:3208],0xffff
mov word[es:3210],0xffff
mov word[es:3212],0xffff
mov word[es:3214],0xffff
mov word[es:3360],0x22db
mov word[es:3362],0x22db
mov word[es:3364],0x22db
mov word[es:3366],0xffff
mov word[es:3368],0xffff
mov word[es:3370],0xffff
mov word[es:3372],0xffff
mov word[es:3374],0xffff

pop ax
pop es
ret


;-------------------------------------------------------------Gear-----------------------------------------------------------;

gear:

  mov bp,sp
  push ax  
  push es
  push cx
  push si 
  push di
  push bx
  push dx
  mov cx,2
  mov ax,0xb800
  mov es,ax  
  mov al,80
  mul byte[bp+10]
  add ax,[bp+12]
  shl ax,1
  mov di,ax
  mov di,[bp+4]
  mov bx,[bp+4]
  mov si,[bp+2]
  mov dx,[bp+2]
ga:
  mov word[es:di],0x01cd
  add di,2
  cmp di,si
  jne ga
  pop dx
  pop bx
  pop di
  pop si
  pop cx
  pop es
  pop ax
  ret 4

steering_center:

  mov bp,sp
  push ax
  push es
  push cx
  push si
  push di
  push bx
  push dx
  mov cx,2
  mov ax,0xb800
  mov es,ax
  mov al,80
  mul byte[bp+10]
  add ax,[bp+12]
  shl ax,1
  mov di,ax
  mov di,[bp+4]
  mov bx,[bp+4]
  mov si,[bp+2]
  mov dx,[bp+2]
s_c_:
  mov word[es:di],0x38db
  add di,2
  cmp di,si
  jne s_c_
  pop dx
  pop bx
  pop di
  pop si
  pop cx
  pop es
  pop ax
  ret 4

gearbox:

  mov bp,sp
  push ax
  push es
  push cx
  push si
  push di
  push bx
  push dx
  mov cx,2
  mov ax,0xb800
  mov es,ax
  mov al,80
  mul byte[bp+10]
  add ax,[bp+12]
  shl ax,1
  mov di,ax
  mov di,[bp+4]
  mov bx,[bp+4] 
  mov si,[bp+2]
  mov dx,[bp+2]
gb:
  mov word[es:di],0x01ba
  add di,2
  cmp di,si
  jne gb
  pop dx
  pop bx
  pop di 
  pop si
  pop cx
  pop es
  pop ax
  ret 4


l500:

  jmp signal
ster_chk:
  add si,160
  add di,160
  jmp s_c

ster:
push si
push di
push ax
  mov si,3430 
  mov di,3434
s_c:
  mov ax,si        ;starting point
  push ax
  mov ax,di        ;ending point  
  push ax
  call black
  cmp di,3914
  je ster2
  cmp di,3914
  jne ster_chk
ster_chk2:
  add si,160
  add di,160
  jmp s_c2
ster2:
  mov si,3460
  mov di,3464
s_c2:
  mov ax,si        ;starting point
  push ax
  mov ax,di        ;ending point
  push ax
  call black
  cmp di,3944
  je l500
  cmp di,3944
  jne ster_chk2
signal_c:
  add si,160
  add di,160
  jmp s_ch
signal:
  mov si,170
  mov di,188
s_ch:
  mov ax,si        ;starting point
  push ax
  mov ax,di        ;ending point
  push ax
  call black
  cmp di,828
  jne signal_c

l200:
  mov ax,3792
  push ax
  mov ax,3808
  push ax
  call black
  mov ax,3800
  push ax
  mov ax,3802
  push ax
  call gearbox
  mov ax,3792
  push ax
  mov ax,3794 
  push ax
  call gearbox
  mov ax,3808
  push ax
  mov ax,3810  
  push ax
  call gearbox
  mov ax,3968 
  push ax
  mov ax,3970
  push ax
  call gearbox
  mov ax,3952
  push ax
  mov ax,3968
  push ax
  call gear
  mov ax,3952
  push ax
  mov ax,3954
  push ax
  call gearbox
  mov ax,3960
  push ax
  mov ax,3962
  push ax
  call gearbox
  mov ax,170
  push ax
  mov ax,178
  push ax
  call red
  mov ax,180
  push ax
  mov ax,188
  push ax
  call red
  mov ax,490
  push ax
  mov ax,498
  push ax
  call red
  mov ax,500
  push ax
  mov ax,508 
  push ax
  call red
  mov ax,810
  push ax
  mov ax,818
  push ax
  call green
  mov ax,820
  push ax
  mov ax,828
  push ax
  call green
  mov ax,44
  push ax
  mov ax,22
  push ax
  mov ax,3
  push ax
  mov ax,temp
  push ax
  push word[length]
  call printstr
  mov ax,38
  push ax
  mov ax,22
  push ax
  mov ax,3
  push ax
  mov ax,speed
  push ax
  push word[length1]
call printstr
mov ax,3914
push ax
mov ax,3940
push ax
call des
mov ax,3922
push ax
mov ax,3932
push ax
call steering_center
mov ax,3762
push ax
mov ax,3772
push ax
call steering_center
mov ax,3792
push ax
call circle
mov ax,3894
push ax
mov ax,3898
push ax
call red
mov ax,3894
push ax
call fire
jmp l300
l300:
pop ax
pop di
pop si
ret 
button:

 	push bp
 	mov bp,sp
 	push ax
 	push es
 	push di
 	push cx
    	push si

	    mov ax,0xb800
     	mov es,ax
		mov di,[bp+4]
		mov ax,0x0904
		mov [es:di],ax


		 pop si
       pop cx
       pop di
       pop es
       pop ax
       pop bp
       ret 2

 fire:
    push bp
 	mov bp,sp
 	push ax
 	push es
 	push di
 	push cx
    	push si

	    mov ax,0xb800
     	mov es,ax
		mov di,[bp+4]
		mov cx,1
		mov ax,0x4746
	    mov [es:di],ax
	   pop si
       pop cx
       pop di
       pop es
       pop ax
       pop bp
       ret 2


	circle:

 	push bp
 	mov bp,sp
 	push ax
 	push es
 	push di
 	push cx
    push si

	    mov ax,0xb800
     	mov es,ax
		mov di,[bp+4]
		mov ax,0x0A6f;ascii of o
		mov [es:di],ax


	   pop si
       pop cx
       pop di
       pop es
       pop ax
       pop bp
       ret 2

clrscr: 
push es
push ax
push di
mov ax, 0xb800
mov es, ax ; point es to video base
mov di, 0 ; point di to top left column
nextloc: mov word [es:di], 0x0720 ; clear next char on screen
add di, 2 ; move to next screen location
cmp di, 4000 ; has the whole screen cleared
jne nextloc ; if no clear next position
pop di
pop ax
pop es
ret

redish:
	push es
	push ax
	push cx 
	push di
	mov ax,0xb800
	mov es,ax
	mov di,162
	mov cx,84
linee:
		mov word[es:di],0x34db
		add di,2
		sub cx,1
		cmp cx,81
		jne linee

		pop di
		pop cx
		pop ax
		pop es
		ret

greenish:

	push es
	push ax
	push cx 
	push di
	mov ax,0xb800
	mov es,ax
	mov di,482
	mov cx,244
lineee:
		mov word[es:di],0x06db
		add di,2
		sub cx,1
		cmp cx,241
		jne lineee

		pop di
		pop cx
		pop ax
		pop es
		ret
yellowish:

	push es
	push ax
	push cx 
	push di
	mov ax,0xb800
	mov es,ax
	mov di,802
	mov cx,404
lineeee:
		mov word[es:di],0x22db
		add di,2
		sub cx,1
		cmp cx,401
		jne lineeee

		pop di
		pop cx
		pop ax
		pop es
		ret

;-------------------------------------------------------------GrassArea-----------------------------------------------------------;
GrassArea:
	push si
	push di
	push ax
	push cx
	push bx
	push dx
	push es
	mov si,1121 ;;left start
	mov di,1181  ;;left end
	mov bx,1223  ;;right start
	mov cx,1281   ;;right end
	c_g:
	push si
	mov ax,0xb800
	mov es,ax
	gl:
	mov byte[es:si],0x23
	add si,2
	cmp di,si
	jne gl
	mov si,bx
	gr:
	mov byte[es:si],0x23
	add si,2
	cmp cx,si
	jne gr
	pop si
	push di
	push bx
	call road
	cGA:
	add si,160 
	add di,156
	add bx,164
	add cx,160 
	cmp cx,3201
	jne c_g
	cmp word[fr],1
	jne ende
	mov word[end],1
	ende:
	pop es
	pop dx
	pop bx
	pop cx
	pop ax
	pop di
	pop si
	ret

	grass:
	push bp
	mov bp,sp
	push ax
	push es
	push si
	push di
	mov ax,0xb800
	mov es,ax
	mov di,[bp+4]
	mov si,[bp+6]
	g:
	mov byte[es:si],0x23
	add si,2
	cmp di,si
	jne g
	pop di
	pop si
	pop es
	pop ax
	pop bp
	ret 4

	road:
	push bp
	mov bp,sp
	push ax
	push es
	push si
	push di
	mov ax,0xb800
	mov es,ax
	mov di,[bp+4]
	mov si,[bp+6]
	r:
	mov byte[es:si],0x73
	add si,2
	cmp di,si
	jne r
	pop di
	pop si
	pop es
	pop ax
	pop bp
	ret 4

;-------------------------------------------------------------Patches-----------------------------------------------------------;

patches1:

	push es
	push ax
	mov ax,0xb800
	mov es,ax
	mov word[es:1198],0x0720
	mov word[es:1200],0x0720
	mov word[es:1202],0x0720
	mov word[es:1358],0x0720
	mov word[es:1360],0x0720
	mov word[es:1362],0x0720
	mov word[es:1518],0x0720
	mov word[es:1520],0x0720
	mov word[es:1522],0x0720
	pop ax
	pop es
	ret

patches2:

	push es
	push ax
	mov ax,0xb800
	mov es,ax
	mov word[es:1838],0x0720
	mov word[es:1840],0x0720
	mov word[es:1842],0x0720
	mov word[es:1998],0x0720
	mov word[es:2000],0x0720
	mov word[es:2002],0x0720
	mov word[es:2158],0x0720
	mov word[es:2160],0x0720
	mov word[es:2162],0x0720
	pop ax
	pop es
	ret

patches3:

	push es
	push ax
	mov ax,0xb800
	mov es,ax
	mov word[es:2478],0x0720
	mov word[es:2480],0x0720
	mov word[es:2482],0x0720
	mov word[es:2638],0x0720
	mov word[es:2640],0x0720
	mov word[es:2642],0x0720
	mov word[es:2798],0x0720
	mov word[es:2800],0x0720
	mov word[es:2802],0x0720
	pop ax
	pop es
	ret

crow:

	push es
	push ax
	mov ax,0xb800
	mov es,ax

	mov word[es:180],0x0720
	mov word[es:182],0x0720
	mov word[es:186],0x0720
	mov word[es:188],0x0720
	mov word[es:344],0x0720

	mov word[es:210],0x0720
	mov word[es:212],0x0720
	mov word[es:216],0x0720
	mov word[es:218],0x0720
	mov word[es:374],0x0720

	mov word[es:300],0x0720
	mov word[es:302],0x0720
	mov word[es:306],0x0720
	mov word[es:308],0x0720
	mov word[es:464],0x0720

	pop ax
	pop es
	ret

sun:

	push es
	push ax
	mov ax,0xb800
	mov es,ax

	mov word[es:290],0x26db
	mov word[es:292],0x26db
	mov word[es:294],0x26db
	mov word[es:296],0x26db
	mov word[es:298],0x26db
	mov word[es:450],0x26db
	mov word[es:452],0x26db
	mov word[es:454],0x26db
	mov word[es:456],0x26db
	mov word[es:458],0x26db
	mov word[es:610],0x26db
	mov word[es:612],0x26db
	mov word[es:614],0x26db
	mov word[es:616],0x26db
	mov word[es:618],0x26db
	pop ax
	pop es
	ret

fuel:

	push es
	push ax
	mov ax,0xb800
	mov es,ax

	mov word[es:3700],0x0720
	mov word[es:3702],0x0720
	mov word[es:3704],0x0720
	mov word[es:3706],0x0720
	mov word[es:3860],0x4720
	mov word[es:3862],0x4720
	mov word[es:3864],0x4720
	mov word[es:3866],0x4720

	mov word[es:3860],0x4746
	mov word[es:3862],0x4755
	mov word[es:3864],0x4745
	mov word[es:3866],0x474c
	pop ax
	pop es
	ret

gas:

	push es
	push ax
	mov ax,0xb800
	mov es,ax

	mov word[es:3720],0x0720
	mov word[es:3722],0x0720
	mov word[es:3724],0x0720
	mov word[es:3726],0x0720
	mov word[es:3880],0x22db
	mov word[es:3882],0x22db
	mov word[es:3884],0x22db
	mov word[es:3886],0x22db

	mov word[es:3880],0x2447
	mov word[es:3882],0x2441
	mov word[es:3884],0x2453
	mov word[es:3886],0x2453
	pop ax
	pop es
	ret

;-------------------------------------------------------------Leftturn-----------------------------------------------------------;

leftturns:

	push es
	push ax
	push di
	push cx
	mov ax,0xb800
	mov es,ax

	mov word[es:1144],0xffff
	mov word[es:1146],0xffff
	mov word[es:1148],0xffff
	mov word[es:1150],0xffff
	mov word[es:1152],0xffff
	mov word[es:1154],0xffff
	mov word[es:1156],0xffff
	mov word[es:1158],0xffff
	mov word[es:1160],0xffff
	mov word[es:1162],0xffff
	mov word[es:1164],0xffff
	mov word[es:1166],0xffff
	mov word[es:1168],0xffff
	mov word[es:1170],0xffff
	mov word[es:1172],0xffff
	mov word[es:1174],0xffff
	mov word[es:1176],0xffff
	mov word[es:1178],0xffff

	mov word[es:1306],0xffff
	mov word[es:1308],0xffff
	mov word[es:1310],0xffff
	mov word[es:1312],0xffff
	mov word[es:1314],0xffff
	mov word[es:1316],0xffff
	mov word[es:1318],0xffff
	mov word[es:1320],0xffff
	mov word[es:1322],0xffff
	mov word[es:1324],0xffff
	mov word[es:1326],0xffff
	mov word[es:1328],0xffff
	mov word[es:1330],0xffff
	mov word[es:1332],0xffff
	mov word[es:1334],0xffff
	mov word[es:1336],0xffff
	mov word[es:1338],0xffff

	mov word[es:1468],0xffff
	mov word[es:1470],0xffff
	mov word[es:1472],0xffff
	mov word[es:1474],0xffff
	mov word[es:1476],0xffff
	mov word[es:1478],0xffff
	mov word[es:1480],0xffff
	mov word[es:1482],0xffff
	mov word[es:1484],0xffff
	mov word[es:1486],0xffff
	mov word[es:1488],0xffff
	mov word[es:1490],0xffff
	mov word[es:1492],0xffff
	mov word[es:1494],0xffff
	mov word[es:1496],0xffff
	mov word[es:1498],0xffff

	mov word[es:1630],0xffff
	mov word[es:1632],0xffff
	mov word[es:1634],0xffff
	mov word[es:1636],0xffff
	mov word[es:1638],0xffff
	mov word[es:1640],0xffff
	mov word[es:1642],0xffff
	mov word[es:1644],0xffff
	mov word[es:1646],0xffff
	mov word[es:1648],0xffff
	mov word[es:1650],0xffff
	mov word[es:1652],0xffff
	mov word[es:1654],0xffff
	mov word[es:1656],0xffff
	mov word[es:1658],0xffff

	mov word[es:1792],0xffff
	mov word[es:1794],0xffff
	mov word[es:1796],0xffff
	mov word[es:1798],0xffff
	mov word[es:1800],0xffff
	mov word[es:1802],0xffff
	mov word[es:1804],0xffff
	mov word[es:1806],0xffff
	mov word[es:1808],0xffff
	mov word[es:1810],0xffff
	mov word[es:1812],0xffff
	mov word[es:1814],0xffff
	mov word[es:1816],0xffff
	mov word[es:1818],0xffff

	mov word[es:1216],0x22db
	mov word[es:1218],0x22db
	mov word[es:1220],0x22db

	mov word[es:1380],0x22db
	mov word[es:1382],0x22db
	mov word[es:1384],0x22db
	
	mov word[es:1544],0x22db
	mov word[es:1546],0x22db
	mov word[es:1548],0x22db

	mov word[es:1708],0x22db
	mov word[es:1710],0x22db
	mov word[es:1712],0x22db
	
	mov word[es:1872],0x22db
	mov word[es:1874],0x22db
	mov word[es:1876],0x22db

	pop cx
	pop di
	pop ax
	pop es
	ret

silver:

	push es
	push ax
	push di
	push cx
	mov ax,0xb800
	mov es,ax

	mov word[es:1216],0xffff
	mov word[es:1218],0xffff
	mov word[es:1220],0xffff
	
	mov word[es:1380],0xffff
	mov word[es:1382],0xffff
	mov word[es:1384],0xffff
	
	mov word[es:1544],0xffff
	mov word[es:1546],0xffff
	mov word[es:1548],0xffff
	
	mov word[es:1708],0xffff
	mov word[es:1710],0xffff
	mov word[es:1712],0xffff

	mov word[es:1872],0xffff
	mov word[es:1874],0xffff
	mov word[es:1876],0xffff
	
	pop cx
	pop di
	pop ax
	pop es
	ret


;-------------------------------------------------------------Trees-----------------------------------------------------------;
trees:

	push es
	push ax
	push di
	push cx
	mov ax,0xb800
	mov es,ax

	tree1:
		mov word[es:490] ,0x0adb
		mov word[es:492] ,0x0adb
		mov word[es:494] ,0x0adb
		mov word[es:650] ,0x0adb
		mov word[es:652] ,0x0adb 
		mov word[es:654] ,0x0adb
		mov word[es:812] ,0x06db 
		mov word[es:972] ,0x06db
	
	tree2:
		mov word[es:510] ,0x0adb
		mov word[es:512] ,0x0adb
		mov word[es:514] ,0x0adb
		mov word[es:670] ,0x0adb
		mov word[es:672] ,0x0adb 
		mov word[es:674] ,0x0adb
		mov word[es:832] ,0x06db 
		mov word[es:992] ,0x06db

	tree3:
		mov word[es:530] ,0x0adb
		mov word[es:532] ,0x0adb
		mov word[es:534] ,0x0adb
		mov word[es:690] ,0x0adb
		mov word[es:692] ,0x0adb 
		mov word[es:694] ,0x0adb
		mov word[es:852] ,0x06db 
		mov word[es:1012],0x06db

	tree4:
		mov word[es:550] ,0x0adb
		mov word[es:552] ,0x0adb
		mov word[es:554] ,0x0adb
		mov word[es:710] ,0x0adb
		mov word[es:712] ,0x0adb 
		mov word[es:714] ,0x0adb
		mov word[es:872] ,0x06db 
		mov word[es:1032],0x06db

	tree5:
		mov word[es:570] ,0x0adb
		mov word[es:572] ,0x0adb
		mov word[es:574] ,0x0adb
		mov word[es:730] ,0x0adb
		mov word[es:732] ,0x0adb 
		mov word[es:734] ,0x0adb
		mov word[es:892] ,0x06db 
		mov word[es:1052],0x06db

	tree6:
		mov word[es:590] ,0x0adb
		mov word[es:592] ,0x0adb
		mov word[es:594] ,0x0adb
		mov word[es:750] ,0x0adb
		mov word[es:752] ,0x0adb 
		mov word[es:754] ,0x0adb
		mov word[es:912] ,0x06db 
		mov word[es:1072],0x06db

	tree7:
		mov word[es:610] ,0x0adb
		mov word[es:612] ,0x0adb
		mov word[es:614] ,0x0adb
		mov word[es:770] ,0x0adb
		mov word[es:772] ,0x0adb 
		mov word[es:774] ,0x0adb
		mov word[es:932] ,0x06db 
		mov word[es:1092],0x06db

	tree8:
		mov word[es:630] ,0x0adb
		mov word[es:632] ,0x0adb
		mov word[es:634] ,0x0adb
		mov word[es:790] ,0x0adb
		mov word[es:792] ,0x0adb 
		mov word[es:794] ,0x0adb
		mov word[es:952] ,0x06db 
		mov word[es:1112],0x06db

		mov di,960
		mov cx,80
soil:

		mov word[es:di],0x06db
		add di,2
		loop soil
		pop cx
		pop di
		pop ax
		pop es
		ret
delay:
	push cx
	mov cx, 1; change the values  to increase delay time
	delayloop1:
	push cx
	mov cx, 0xeeee
	delayloop2:
	loop delayloop2
	pop cx
	loop delayloop1
	pop cx
	ret

delay_:
	push cx
	mov cx, 7; change the values  to increase delay time
	delayloop11:
	push cx
	mov cx, 0xffff
	delayloop21:
	loop delayloop21
	pop cx
	loop delayloop11
	pop cx
	ret
background_lights:

push es
push ax
push cx
push di
mov ax,0xb800
mov es,ax
mov di,0
mov ax,5
mov cx,7

loop1:
mov word[es:di],0x0720
add di,2
sub ax,1
cmp ax,0
jne loop1
add di,150
mov ax,5
loop loop1

pop di
pop cx
pop ax
pop es
ret

bush1:

push es
push ax

mov ax,0xb800
mov es,ax

     mov word[es:1470] ,0x0adb
     mov word[es:1472] ,0x0adb
     mov word[es:1474] ,0x0adb
     mov word[es:1630] ,0x0adb
     mov word[es:1632] ,0x0adb 
     mov word[es:1634] ,0x0adb
     mov word[es:1792] ,0x06db 
     
     pop ax
     pop es
     ret
rbush1:

push es
push ax

mov ax,0xb800
mov es,ax

    mov word[es:1470] ,0x22db
     mov word[es:1472] ,0x22db
     mov word[es:1474] ,0x22db
     mov word[es:1630] ,0x22db
     mov word[es:1632] ,0x22db 
     mov word[es:1634] ,0x22db
     mov word[es:1792] ,0x22db 
     pop ax
     pop es
     ret

bush2:

push es
push ax
push di
push cx
mov ax,0xb800
mov es,ax

     mov word[es:1570] ,0x0adb
     mov word[es:1572] ,0x0adb
     mov word[es:1574] ,0x0adb
     mov word[es:1730] ,0x0adb
     mov word[es:1732] ,0x0adb 
     mov word[es:1734] ,0x0adb
     mov word[es:1892] ,0x06db 
    
     pop cx
     pop di
     pop ax
     pop es
     ret

rbush2:

push es
push ax
push di
push cx
mov ax,0xb800
mov es,ax

     mov word[es:1570] ,0x22db
     mov word[es:1572] ,0x22db
     mov word[es:1574] ,0x22db
     mov word[es:1730] ,0x22db
     mov word[es:1732] ,0x22db 
     mov word[es:1734] ,0x22db
     mov word[es:1892] ,0x22db 
    
     pop cx
     pop di
     pop ax
     pop es
     ret

cycle:

call GrassArea
call patches1
call sky
call crow
call bush1
call bush2
call background_lights
call redish
call greenish
call yellowish
call delay

call GrassArea
call rbush1
call rbush2
call patches2
call sky
call background_lights
call redish
call greenish
call yellowish
call delay

call GrassArea
call rbush1
call rbush2
call patches3
call sky
call background_lights
call redish
call greenish
call yellowish
call delay
ret

leftturns1:
call leftturns
call delay_
ret

cycle2:

call GrassArea
call rbush2
call silver
call patches1
call sky
call trees
call background_lights
call redish
call greenish
call yellowish
call delay

call GrassArea
call  rbush2
call patches2
call sky
call trees
call background_lights
call redish
call greenish
call yellowish
call delay

call GrassArea
call rbush2
call patches3
call sky
call trees
call background_lights
call redish
call greenish
call yellowish
call delay
ret

leftturns2:
call leftturns
call delay
ret

cycle3:

call GrassArea
call silver
call patches1
call sky
call sun
call bush1
call bush2
call background_lights
call redish
call greenish
call yellowish
call delay

call GrassArea
call rbush1
call rbush2
call patches2
call sky
call sun
call background_lights
call redish
call greenish
call yellowish
call delay

call GrassArea
call patches3
call sky
call sun
call rbush1
call rbush2
call background_lights
call redish
call greenish
call yellowish
call delay

ret

kbisr:

   push ax 
   push es 
   mov ax, 0xb800 
   mov es, ax                  ; point es to video memory 
   in al, 0x60                 ; read a char from keyboard port 
   cmp al, 0x48                ; has the left shift pressed 
   jne nextcmp                 ; no, try next comparison 
   call cycle
   jmp exit                    ; leave interrupt routine 

 nextcmp:

   cmp al, 0x4b                ; has the right shift pressed 
   jne nextcmp2                ; no, try next comparison 
   call leftturns1             ; yes, print R at second column 
   call cycle2
   jmp exit                    ; leave interrupt routine 

 nextcmp2:

   cmp al, 0x50                ; has the left shift released 
   jne nextcmp3                ; no, try next comparison 
   call sky

   call fuel
   call gas
   call GrassArea
   call patches1
   call patches2
   call patches3
   call gas
   call fuel
   call bush1
   call bush2
   call trees
  ; call ster
   jmp exit                    ; leave interrupt routine 

   nextcmp3:

   cmp al, 0x4d                ; has the right shift released 
   jne nomatch                 ; no, chain to old ISR 
   call cycle3              ; yes, clear the second column 
   jmp exit                    ; leave interrupt routine 

   nomatch:

   pop es 
   pop ax 
   jmp far [cs:oldisr]         ; call the original ISR 

 exit:

   mov al, 0x20 
   out 0x20, al                ; send EOI to PIC 
   pop es 
   pop ax 
  ; call ster
   iret                        ; return from interrupt 

start:

call clrscr
call sky
call dashboard
call fuel
call gas
call GrassArea
call ster
call patches1
call patches2
call patches3
call backmirrors

  xor ax, ax 
  mov es, ax                   ; point es to IVT base 
  mov ax, [es:9*4] 
  mov [oldisr], ax             ; save offset of old routine 
  mov ax, [es:9*4+2] 
  mov [oldisr+2], ax           ; save segment of old routine 
  cli                          ; disable interrupts 
  mov word [es:9*4], kbisr     ; store offset at n*4 
  mov [es:9*4+2], cs           ; store segment at n*4+2 
  sti                          ; enable interrupts 
  mov dx, start                ; end of resident portion 
  add dx, 15                   ; round up to next para 
  mov cl, 4 
  shr dx, cl                   ; number of paras 
  mov ax, 0x3100               ; terminate and stay resident 
  int 0x21