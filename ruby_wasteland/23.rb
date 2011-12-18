#!/usr/bin/ruby

@@allfacts = {}
def factors (x)
    if @@allfacts[x] != nil
        return @@allfacts[x]
    end

    facts = {1 => 1}
    y = x/2 + 1 
    while y > 1
        y = y - 1
        next if facts[y] != nil
#        #print "Checking " + y.to_s + "(" + x.to_s + ")\n"
        if (x % y) == 0 
            facts[y] = 1
            facts[x/y] = 1
#            facts = facts.merge(factors(y))
        end
    end
    @@allfacts[x] = facts
    return facts
end

def isAbundant (x)
    fact = factors(x)
    sum = 0
    fact.keys.each {|n| sum = sum + n.to_i}
    #print x.to_s + ": [" + fact.keys.sort.join(", ") + "] sum: " + sum.to_s + "\n"
    sum > x
end

sum = 0
abundants = {}
for i in (1...10000)
    if isAbundant(i)
        abundants[i] = 1
    end
end

printf "\n"
puts abundants.size
