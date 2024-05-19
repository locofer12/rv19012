section .data
    num1 dw 80
    num2 dw 5
    num3 dw 3

segment .bss
    resultado resb 16 

section .text

;sustituimos al por ax y bl por bh par que sea de 16 bits y la .data en lugar de db sera dw
global _start

_start:
    mov ax, [num1]
    sub ax, [num2]
    sub ax, [num3]
    
    mov ah,0
    mov bh, 10
    div bh
    
    add ax, '0'
    add ah, '0'
    
    mov [resultado], ax
    mov [resultado +1], ah
    
    mov eax,4
    mov ebx,1
    mov ecx, resultado
    mov edx, 2
    int 0x80
    
    mov eax,1
    mov ebx,0
    int 0x80