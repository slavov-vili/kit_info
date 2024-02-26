# x86 Assembler Programming
1. General Purpose Registers
    - 32-bit:
        * ![image](images/registers_32bit.png)
    - 64-bit:
        * ![image](images/registers_64bit.png)
        * 8 bytes
1. Instructions
    - **Intel**/AT&T Syntax = Left/Right is the target
    - Basics:
        * mov rax, 10    // rax = 10
        * add rbx, rcx   // rbx += rcx
        * sub eax, [rdx] // eax -= \<value at address = value of rdx)\>
        * or edi, esi    // edi |= esi (bitwise or)
        * shr esi, 3     // esi >>= 3  (shift right)
    - Stack Control:
        * Stack grows towards **lower** addresses
        * esp/rsp = stack pointer = current place in the stack
        * ebp/rbp = frame/base pointer
        * push rbp
            + rsp -= 8   // reserve 8 bytes on the stack
            + \*rsp = rbp // put the value of rbp in those 8 bytes on the stack
        * pop rbp
            + rbp = \*rsp // store the current value from the stack in rbp
            + rsp += 8   // free up 8 bytes from the stack
        * sub rsp, 32    // reserve 32 bytes on the stack
        * add rsp, 32    // free up 32 bytes on the stack
        * and rsp, ~0xF  // rsp &= 0xF...F0 (alignment?)
        * leave (fixes up the stack?)
            + mov rsp, rbp // 
            + pop rbp      //
    - Flow Control:
        * eip/rip = Instruction Pointer Register
        * jmp foo       // rip = foo (jump to label foo)
        * call fgets    // push rip; jmp fgets
        * ret           // pop rip (function return, fixes up the instruction pointer)
        * ret 8         // ret; add rsp, 8 (return and free up stack?)
    - Conditional jumps
        * Arithmetic/logic operations influence the eflags/rflags register
        * Conditional jumps check the flags
        * cmp ~= sub, test ~= and (they throw away the result and only set the flags)
        * Flag examples:
            + zero = result was 0
            + signed = result was negative (highest bit was 1)
            + carry = carry occurred on the highest bit
        * cmp rax, 10
        * ![image](images/conditional_jumps.png)
        * Signed
            + jg = jump if greater
            + jl = jump if less
        * Unsigned
            + ja = jump if above
            + jb = jump if below
    - Other useful instructions
        * xchg rax, rbx           // exchange values
        * lea rax, [rbx + 8\*rdi] // rax = rbx + 8\*rdi
        * inc/dec rcx             // rcx +=/-= 1



# Calling Conventions
1. Definition
    - Specifies the communication between functions (caller and callee)
    - How are arguments passed?
    - How is the return value passed?
    - What registers may the callee overwrite?
1. cdecl
    - 32 bit
    - arguments are pushed in reverse order on the stack
    - result is (mostly) in eax
    - **callee must preserve** ebx,ebp,esi,edi
    - different rules for floats,doubles,structs
    - Example:
    - ![image](images/conventions_cdecl.png)
1. System V
    - 64 bit
    - mostly similar to cdecl
    - first 6 args in rdi,rsi,rdx,rcx,r8,r9
    - further args - on the stack
    - **callee must preserve** rbx,rsp,rbp,r12-r15
    - Example:
    - ![image](images/conventions_systemv.png)
1. Microsoft x64 ABI
    - 64 bit
    - mostly analogous
    - arguments in rcx,rdx,r8,r9
    - further args - on the stack
    - 32-byte "red zone" between return address and arguments
    - **callee must preserve** rbx,rbp,rdi,rsi,r12-r15
1. fastcall
    - not standardized => different incompatible versions
    - like cdecl, but:
    - ecx,edx used for first 2 args
    - **callee** must free up stack space used for arguments



# Debugging with gdb
1. Definition
    - = GNU Debugger
    - lets us watch program internals during execution
    - basics: interrupting execution, examining data
    - recommended: use PEDA
1. Basics
    - r = run
    - b main = breakpoint
    - si = step instruction
    - x/rfs = examine memory address
        * r = repeat count
        * f = format letter (hex, decimal, string, char)
        * s = size (byte, halfword, word, giant)
        * $rip = value of rip
            + use rsp to view stack
    - disass(emble) = show contents of label
    - Can run on a running process with -p
        * Find process using ps or pidof



# Ghidra
1. Definition
    - tool that does sth
    - XOR AEX AEX = leeren von AEX, da nur 2 byte



# Übungsblatt
