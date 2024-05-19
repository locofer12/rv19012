section .data
    num1 db 2 ; datos de entrada solo enteros 
    num2 db 3

section .bss
    resultado resb 2

section .text

global _start

_start:
    mov al, [num1]           ; Carga num1 en al
    mul byte [num2]          ; Multiplica al por num2
    
    mov bl, 10               ; Divisor paa la división
    xor ah, ah               ; Limpia el registro ah para la división
    div bl                   ; Dividir ax por bl (10)
    
    add al, '0'              ; Convertir el byte bajo a ASCII
    add ah, '0'              ; Convertir el byte alto a ASCII
    
    mov [resultado], al      ; Almacena el byte bajo del resultado
    mov [resultado + 1], ah  ; Almacena el byte alto del resultado

    mov eax, 4               ; Llamada al sistema para imprimir
    mov ebx, 1               ; Descriptor de archivo (stdout)
    mov ecx, resultado       ; Dirección del resultado
    mov edx, 2               ; Longitud del resultado
    int 0x80                 ; Llamada al sistema para imprimir

    mov eax, 1               ; Llamada al sistema para terminar el programa
    xor ebx, ebx             ; Código de salida (éxito)
    int 0x80                 ; Llamada al sistema para terminar el programa
