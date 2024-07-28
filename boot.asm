ORG 0x7c00
BITS 16 

start:

  move si, message

  call print
  
    jmp $
print:
  mov bx, 0
.loop:  
  lodsb
  cmp al, 0
  je .done
  call print_char
  jmp .loop
.done:
  ret  
  print_char:   
   mov ah, 0eh
   int 0x10 ; calling the bios .
   ret
   message: db 'Hello Polar',0

 times 510- ($ -$$) db 0 ;to fill at least 510 bytes of data but if we dont it will pad the rest with 0
 dw 0xAA55 ;fot intel machines and dw will put 0xAA55 as binary


