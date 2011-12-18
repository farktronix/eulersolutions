#!/usr/bin/ruby

def digitToWord (x)
    case x
    when 1
     "one"
    when 2
     "two"
    when 3
     "three"
    when 4
     "four"
    when 5
     "five"
    when 6
     "six"
    when 7
     "seven"
    when 8
     "eight"
    when 9
     "nine"
    when 0
     ""
    end
end

def tensToWord (x)
    case x
    when (0...10)
     digitToWord(x)
    when 10
     "ten"
    when 11
     "eleven"
    when 12
     "twelve"
    when 13
     "thirteen"
    when 14
     "fourteen"
    when 15
     "fifteen"
    when 16
     "sixteen"
    when 17
     "seventeen"
    when 18
     "eighteen"
    when 19
     "nineteen"
    when (20...30)
     "twenty"+digitToWord(x%10)
    when (30...40)
     "thirty"+digitToWord(x%10)
    when (40...50)
     "forty"+digitToWord(x%10)
    when (50...60)
     "fifty"+digitToWord(x%10)
    when (60...70)
     "sixty"+digitToWord(x%10)
    when (70...80)
     "seventy"+digitToWord(x%10)
    when (80...90)
     "eighty"+digitToWord(x%10)
    when (90...100)
     "ninety"+digitToWord(x%10)
    end
end

def hundredsToWord (x)
    words = ""
    case x
    when (0...100)
        words = tensToWord(x)
    when (100...1000)
        words = digitToWord(x/100)+"hundred"
    end
    if (x % 100) != 0
        words = words + "and" + tensToWord(x % 100)
    end
    words
end

def numToWords (num)
    words = ""
    if num == 1000
        words = "onethousand"
    elsif num >= 100
        words = hundredsToWord(num)
    elsif num >= 10
        words = tensToWord(num)
    else
        words = digitToWord(num) 
    end
    words
end

sum = 0 
for i in (1..1000)
    sum += numToWords(i).length
end
puts sum
