#!/usr/bin/ruby

count = 0
total = 0
for i in (1..1000000)
    if i.to_s == i.to_s.reverse and i.to_s(2) == i.to_s(2).reverse
        count = count + 1
        total = total + i
    end
end

printf("Total is %d. %d numbers found.\n", total, count)

