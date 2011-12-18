#!/usr/bin/ruby

@@allPrimes = {1=>false}
def isPrime (x)
    if @@allPrimes[x] != nil
        return @@allPrimes[x]
    end

    @@allPrimes[x] = true
    y = 2
    while y <= Math.sqrt(x).floor 
        if (x % y) == 0
            @@allPrimes[x] = false
            break
        end
        y = y + 1
    end
    
    return @@allPrimes[x]
end

def isCircular (x)
    num = x.to_s.split(//)
    for i in (1..num.length)
        #puts "checking "+num.to_s
        return false if not isPrime(num.to_s.to_i)

        # rotate
        first = num[0]
        for i in (1...num.length)
            num[i-1] = num[i] 
        end
        num[0] = num[num.length - 1]
        num[num.length - 1] = first
    end
    return true
end

count = 0
for i in (1..1000000)
    puts i if i % 10000 == 0
    if isPrime(i)
        count = count + 1 if isCircular(i)
    end
end
