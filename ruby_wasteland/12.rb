#!/usr/bin/ruby

@@allfacts = {}
def factors (x)
    if @@allfacts[x] != nil
        return @@allfacts[x]
    end

    facts = {1 => 1, x => 1}
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

for x in (1..100000)
    f = factors(x)
end
puts f.keys.sort.join(", ")
