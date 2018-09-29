global loader                   ; entry symbol for ELF

MAGIC_NUMBER      equ 0x1BADB002     
FLAGS             equ 0x0
CHECKSUM          equ -MAGIC_NUMBER
KERNEL_STACK_SIZE equ 4096


section .bss
align 4
kernel_stack:                   ; label points to beginning of memory
    resb KERNEL_STACK_SIZE      ; reserve stack for kernel


section .text:
align 4                         ; Means that the text is 4 byte aligned
    dd MAGIC_NUMBER
    dd FLAGS
    dd CHECKSUM

loader:
    mov esp, kernel_stack + KERNEL_STACK_SIZE
    
    extern sum_of_three         ; defined in kmain.c
    push dword 3
    push dword 2
    push dword 1
    call sum_of_three           ; result stored in eax
    
    extern fb_write_cell
    push byte 0x2
    push byte 0x8
    push dword 0x41
    push byte 0
    call fb_write_cell
    ;mov [0x000B8000], word 0x2841

.loop:
    jmp .loop                   ; Hang after moving CAFEBABE
