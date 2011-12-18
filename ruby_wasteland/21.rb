#!/usr/bin/ruby

class Array; def sum; inject( nil ) { |sum,x| sum ? sum+x : x }; end; end

@@allfacts = {}
def factors (x)
    if @@allfacts[x] != nil
        return @@allfacts[x]
    end

    facts = {1 => 1, x=>1}
    y = x 
    while y > 1
        y = y - 1
        next if facts[y] != nil
        if (x % y) == 0 
            facts = facts.merge(factors(y))
        end
    end
    @@allfacts[x] = facts
end

def propDivSum (x)
    factors(x).keys.sum - x 
end

allnums = 0
for i in (2..10000)
    x = propDivSum(i)
    if x != i and propDivSum(x) == i
        puts i
        allnums = allnums + i
    end
end

puts allnums
