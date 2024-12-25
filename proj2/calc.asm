;call - записывает адрес метки в стек
;ret - извлекает из стека последний адрес который мы записали в call
;section .bss - память выполняется только в момент выполнения программы переменные которые
;объявленны в этой секции автоматически иницилизируются нулями для последующей иницилизации
; 
global main

section .data       ;секция данных
msg1 db "Enter 1-st number: ", 0
msg2 db "Enter 2-nd number: ", 0

section .bss
    number1 resb 16

section .text
main:
    mov rsi, msg1
    mov rdx, 20
    call print_word
    
    call read_char

    mov rsi, number1
    call str_to_int
    ; mov rsi, msg2
    ; mov rdx, 20
    ; call print

    
    call quit


read_char:              ;функция чтения с терминла
    mov rax, 0
    mov rdi, 0
    mov rsi, number1
    mov edx, 16
    syscall

str_to_int:
    xor rax, rax
    xor rcx, rcx
.loop
    movzx rdx, byte [rsi + rcx]
    cmp rdx, 10



print_word:              ;функция вывода в терминал
    mov rax, 1
    mov rdi, 1
    syscall
    ret

quit:               ;функция выхода из программы
    mov rax, 60
    mov rdi, 0
    syscall

; sum:
;     add
;     mov rsi
;     ret