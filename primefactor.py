#!/usr/bin/python

def getPrimesLessThan (n):
    primes = []
    ii = 2
    while ii < n:
        isPrime = True 
        for prime in primes:
            if (ii % prime) == 0:
                isPrime = False
                break
        if isPrime is True:
            primes.append(ii)
        ii = ii + 1
    print "There are %d primes less than the number %d" % (len(primes), n)
    return primes

allPrimes = []
def getNextPrime ():
    if len(allPrimes) == 0:
        allPrimes.append(2)
        return 2
    ii = allPrimes[len(allPrimes) - 1]
    while True:
        isPrime = True
        for prime in allPrimes:
            if (ii % prime) == 0:
                isPrime = False
                break
        if isPrime is True:
            allPrimes.append(ii)
            return ii
        ii = ii + 1
    

def getNPrimes (n):
    primesFound = 0
    primes = []
    ii = 2
    while True:
        isPrime = True 
        for prime in primes:
            if (ii % prime) == 0:
                isPrime = False
                break
        if isPrime is True:
            primes.append(ii)
            primesFound = primesFound + 1
        if primesFound == n:
            break
        ii = ii + 1
    print "Prime number %d is %d" % (n, primes[len(primes) - 1])
    return primes

def primeFactors (n):
    #primes = getPrimesLessThan(n) 
    curnum = n
    curprime = getNextPrime() 
    factors = []

    while (curnum > curprime):
        if (curnum % curprime) == 0:
            factors.append(curprime)
            curnum = curnum / curprime
        else:
            curprime = getNextPrime()
    if curnum > 1:
        factors.append(curnum)
    return factors

#print primeFactors(317584931803)
print getPrimesLessThan(1000000)
