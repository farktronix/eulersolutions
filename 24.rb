#!/usr/bin/ruby

def factorial (x)
    fact = 1
    while x > 1
        fact = fact * x
        x = x - 1
    end
    return fact
end

#digits = [0, 1, 2]
#num = 4 

digits = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
num = 1000000 - 1

result = ""

while digits.length > 1
    fact = factorial(digits.length - 1)
    pos = (num / fact).floor
    num = num - (pos * fact)
    result = result + digits[pos].to_s
    digits.delete(digits[pos])
end

result = result + digits[0].to_s

puts result
