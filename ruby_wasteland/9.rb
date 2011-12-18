#!/usr/bin/ruby

a = 1
b = 1
limit = 1000

for a in (1..limit)
    for b in (a + 1..limit)
        c = Math.sqrt((a * a) + (b * b)) 
        if a + b + c == 1000
            printf("a: %d  b: %d  c: %d (%d)\n", a, b, c, a * b * c)
            exit 0
        end
    end
end
exit 1
