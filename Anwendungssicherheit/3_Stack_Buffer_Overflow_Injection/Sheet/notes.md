# Exercise 2
1. What I did was correct, but use only sockets or smarter read\_until or somethin
    - Read 1 more each time, slowly collect the canary



# Exercise 3
1. Something about adding stuff and nops
1. Shellcode can't contain 0s and stuff, else reading stops.
    - Have to use sth like *xor rdi rdi* instead of *mov rdi 0*
