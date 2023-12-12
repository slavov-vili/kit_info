# Hijacking the Control Flow
1. Buffer overflow on stack => write access to the stack
    - Can overwrite variables, return addresses (control which code is executed)



# Injecting Shellcode
1. Put custom code in memory and overwrite return address to point to that code
    - Stack address is usually random at program start (execve) and preserved across fork
    - Attacker requires information leak to determine it



# Stack Canaries
