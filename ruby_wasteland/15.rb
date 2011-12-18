#!/usr/bin/ruby

def pascalRow (x)
    row = [1]
    r = x + 1
    for c in (1..x)
        row.push((row[c -1] * ((r - c.to_f)/c.to_f)))
    end
    return row
end

puts pascalRow(40)[20].to_i
