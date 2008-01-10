#!/usr/bin/ruby

@@allFibs = [1, 1, 1]
def fib (n)
    return @@allFibs[n] if @@allFibs[n] != nil
    x = @@allFibs.length
    while x <= n
        @@allFibs.push(@@allFibs[x-1] + @@allFibs[x-2])
        x = x + 1
    end
    return @@allFibs[n]
end

def panDigital (n)
    n_arr = n.to_s.split(//).map {|n| n.to_i}
    return false if n_arr.length < 10
    if n_arr.slice(0...9).sort == [1, 2, 3, 4, 5, 6, 7, 8, 9] and n_arr.slice(-9..n_arr.length).sort == [1, 2, 3, 4, 5, 6, 7, 8, 9]
        return true
    end
    return false
end

def panDigitalEnd (n)
    n_arr = n.to_s.split(//).map {|n| n.to_i}
    return false if n_arr.length < 10
    if n_arr.slice(-9..n_arr.length).sort == [1, 2, 3, 4, 5, 6, 7, 8, 9]
        return true
    end
    return false
end

x = 3
fib = 1
prev = 1
while true
    temp = fib
    fib = fib + prev
    prev = temp
    if x % 1000 == 0
        puts x
        puts fib.to_s.split(//).length
        puts
    end
    if panDigital(fib) #panDigitalStart(fib(x)) and panDigitalEnd(fib(x))
        puts x
        puts fib.to_s.split(//).length
        exit 0
    end
    x = x + 1
end
