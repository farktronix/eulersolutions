#!/usr/bin/ruby

nums = [
[75],
[95, 64],
[17, 47, 82],
[18, 35, 87, 10],
[20, 4, 82, 47, 65],
[19, 1, 23, 75, 3, 34],
[88, 2, 77, 73, 7, 63, 67],
[99, 65, 4, 28, 6, 16, 70, 92],
[41, 41, 26, 56, 83, 40, 80, 70, 33],
[41, 48, 72, 33, 47, 32, 37, 16, 94, 29],
[53, 71, 44, 65, 25, 43, 91, 52, 97, 51, 14],
[70, 11, 33, 28, 77, 73, 17, 78, 39, 68, 17, 57],
[91, 71, 52, 38, 17, 14, 91, 43, 58, 50, 27, 29, 48],
[63, 66, 4, 68, 89, 53, 67, 30, 73, 16, 69, 87, 40, 31],
[04, 62, 98, 27, 23, 9, 70, 98, 73, 93, 38, 53, 60, 4, 23]]

#nums = [
#[3],
#[7, 5],
#[2, 4, 6],
#[8, 5, 9, 3]]

class TreeNode
    attr_accessor :value, :left, :right

    def initialize(value)
        @value = value
        @weight = -1
    end
    
    def weight
        if @weight == -1
            @weight = @value
            lw = 0
            rw = 0
            lw = @left.weight if @left
            rw = @right.weight if @right
            if lw > rw
                @weight = @weight + lw
            else
                @weight = @weight + rw
            end
        end
        return @weight
    end
end

def buildNode (i, j, nums)
    node = TreeNode.new(nums[i][j])
    if (i < nums.length - 1) 
        node.left = buildNode(i + 1, j, nums)
        node.right = buildNode(i + 1, j + 1, nums)
    end
    return node
end

root = buildNode(0, 0, nums)
sum = 0 
curNode = root

#print "Total weight: ", root.weight, "\n"

while curNode != nil
    sum = sum + curNode.value
 #   print curNode.value
    if curNode.left == nil
        print "\n"
        break
    end
#    print " (", curNode.left.weight, ", ", curNode.right.weight, ")\n"
    if curNode.right.weight > curNode.left.weight
        curNode = curNode.right
    else
        curNode = curNode.left
    end
end

puts sum
