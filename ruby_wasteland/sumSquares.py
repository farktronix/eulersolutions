#!/usr/bin/python

sumsquares = 0
squaresums = 0
for ii in range(1, 101):
    sumsquares = sumsquares + (ii * ii)
    squaresums = squaresums + ii
squaresums = squaresums * squaresums
print squaresums - sumsquares
