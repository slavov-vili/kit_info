#!/usr/bin/python

import claripy

s = claripy.Solver()

a = claripy.BVS("a", 32)
b = claripy.BVS("b", 32)

s.add(b == 2 * a)
s.add(b == 20)

print("Solutions for a:")
print(s.eval(a, 3))
