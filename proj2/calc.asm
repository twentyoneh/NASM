;call - записывает адрес метки в стек
;ret - извлекает из стека последний адрес который мы записали в call
;section .bss - память выполняется только в момент выполнения программы переменные которые
;объявленны в этой секции автоматически иницилизируются нулями для последующей иницилизации
; 
global main

section .data       ;секция данных
msg1 db "Enter 1-st number: ", 0
msg2 db "Enter 2-nd number: ", 0
dbg_msg db "You enter number: ", 0
dbg_msg_len equ $ - dbg_msg

section .bss
    number1 resb 16
    buffer resb 16

section .text
main:
    mov rsi, msg1
    mov rdx, 20
    call print_word
    
    call read_char

    mov rsi, number1
    call str_to_int
    mov rbx, rax
    
    mov rsi, dbg_msg
    mov rdx, dbg_msg_len
    call print_word

    mov rsi, number1
    mov rdx, 3
    call print_word

    
    call quit


read_char:              ;функция чтения с терминла
    mov rax, 0
    mov rdi, 0
    mov rsi, number1
    mov edx, 16         ;максимальная длинна слова которая будет в number1
    syscall

str_to_int:             ;перевод из строки в число
    xor rax, rax
    xor rcx, rcx
.loop:
    movzx rdx, byte [rsi + rcx]
    cmp rdx, 10
    je .done
    sub rdx, '0'
    imul rax, rax, 10
    add rax, rdx
    inc rcx
    jmp .loop
.done:
    ret



; [in]
; rax - integer
; number1 - string
int_to_str              ;функция перевода числа в строку 
    mov rdi, buffer
    add rdi, 15
    mov byte [rdi], 0
    dec rdi
    xor rcx, rcx
    mov rbx, 10
.convert: 
    xor rdx, rdx 
    div rbx
    add dl, '0'
    mov [rdi], dl
    dec rdi
    inc rcx
    text rax, rax
    jnz .convert
    inc rdi
    ret

print_word:             ;функция вывода в терминал
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