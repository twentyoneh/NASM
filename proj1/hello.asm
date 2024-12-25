global _start

section .data
message: db "Hello world",10

;то что лежит внутри rax - команды для ОС, которые будут
;вызываться с помощью syscall
;для некоторых комманд нужны дескрипторы функций ОС

section .text
_start:
    mov rax, 1          ;код write
    mov rdi, 1          ;дескриптор файла страндартного вызова cout
    mov rsi, message    ;строка которую будет брать cout
    mov rdx, 13         ;количество байтов для вывода
    syscall

    mov rax, 60         ;
    mov rdi, 0
    syscall
