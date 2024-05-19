section .data
    num1 dd 9      ; dd para que sea de 32 bits
    num2 dd 3      ; Ingresa el numero 2 (32 bits)

section .bss
    resultado resb 2

section .text

global _start

_start:
    mov eax, [num1]          ; Carga num1 en eax
    xor edx, edx             ; Limpia edx para la división (parte alta de EDX:EAX)
    div dword [num2]         ; Dividir EAX por num2, resultado en EAX

    ; Convertir el resultado a ASCII
    mov ebx, 10              ; Divisor para la conversión a decimal
    xor edx, edx             ; Limpia edx para la división
    div ebx                  ; Dividir EAX por 10, cociente en EAX, resto en EDX

    add dl, '0'              ; Convertir el resto a ASCII
    mov [resultado + 1], dl  ; Almacena el byte bajo (resto) en resultado + 1

    add al, '0'              ; Convertir el cociente a ASCII
    mov [resultado], al      ; Almacena el byte alto (cociente) en resultado

    ; Llama al sistema para imprimir el resultado
    mov eax, 4               ; Llamada al sistema para sys_write
    mov ebx, 1               ; Descriptor de archivo (stdout)
    mov ecx, resultado       ; Dirección del resultado
    mov edx, 2               ; Longitud del resultado
    int 0x80                 ; Llamada al sistema

    ; Llamada al sistema para terminar el programa
    mov eax, 1               ; Llamada al sistema para sys_exit
    xor ebx, ebx             ; Codigo de salida (exito)
    int 0x80                 ; Llamada al sistema
