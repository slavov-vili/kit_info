; tell the assembler this is 64-bit code
BITS 64

; declare the name of the function to be called
extern foo_system_v

; make the function globally visible:
global foo_ms_abi

; ms:    rcx,rdx,r8, r9 + stack (4)
; sys_v: rdi,rsi,rdx,rcx,r8,r9 + stack (2)
foo_ms_abi:
    push rbp
    mov rbp, rsp

    push rbx
    push rdi
    push rsi
    push r12
    push r13
    push r14
    push r15

    mov rdi, rcx
    mov rsi, rdx
    mov rdx, r8
    mov rcx, r9
    ; arguments on the stack start at 104
    ; 104 = 96 + 8
    ; 32 "red zone" + 64 (8x push) = + 96
    mov r8, [rsp + 104]
    mov r9, [rsp + 112]
    mov r12, [rsp + 120]
    mov r13, [rsp + 128]
    push r13
    push r12
    call foo_system_v
    pop r13
    pop r12

    pop r15
    pop r14
    pop r13
    pop r12
    pop rsi
    pop rdi
    pop rbx

    pop rbp
    ret
