#!/usr/bin/ruby

def isPrime (x)
    for i in (2..Math.sqrt(x))
        if (x % i) == 0
            return false
        end
    end
    return true
end

def hasNumerator (numerator, x)
    for n in (0..x.length)
        if x[n] == numerator
            #puts "n found: ", n, x[n], x.join(",")
            return n
        end
    end
    return -1
end

def repeats (x)
    i = 1
    result = []
    numerator = [1]
    while true
        result.push(((numerator[i - 1] * 10) / x).floor)
        remainder = (numerator[i - 1] * 10) % x
        if remainder == 0
            #puts "clean"
            return result
        end
        n = hasNumerator(remainder, numerator)
        if (n != -1)
            #puts "repeats ", remainder, numerator.join(","), result.join(","), i
            return result[n..i-1]
        end
        numerator.push(remainder)
        i = i + 1
    end
end

longest = 0
longestn = 0
for n in (1..1000)
    #print "Checking ",n,"\n"
    next if not isPrime(n)
    x = repeats(n)
    #print n, "  ", "0."+x.join, "\n" if not isPrime(n) 
    if x.length > longest
        longest = x.length
        longestn = n
    end
end

print longestn," (",longest,")\n"
