
def A10_ii(n):
    if n == 1:
        return 2;
    else:
        recN = A10_ii(n-1)
        return ((recN ** 2) + 1) / (2 * recN)



def A12_ia(n):
    return (n-1)/(n+1)

def A12_ic(n):
    return (1 + (1 / (2 * n))) ** n

for i in range(1, 20):
    print(A12_ic(i))
