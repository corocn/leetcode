# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
# def two_sum(nums, target)
#     v1, v2 = search(nums.sort,target)
#     [nums.index(v1), nums.length - nums.reverse.index(v2) - 1].sort!
# end

# def search(nums, target)
#    nums.each_with_index do |x, i|
#        nums.each_with_index do |y, j|
#            next if j <= i
#            return [x, y] if x + y == target
#        end
#    end
# end

# def two_sum(nums, target)
#     nums.each_with_index do |x, i|
#        diff = target - x
#        rev_index = nums.reverse.index(diff)
#        next if rev_index == nil
#        index = nums.length - nums.reverse.index(diff) - 1
#        next if index == i

#        return [i, index]
#     end
# end

def two_sum(nums, target)
  nums.each_with_index do |x, i|
    diff = target - x
    index = nums.index(diff)
    next if index == nil

    return [i, index] if index != i

    rev_index = nums.reverse.index(diff)
    rev_rev_index = nums.length - rev_index - 1
    next if rev_index == nil || index == rev_rev_index

    return [i, rev_rev_index]
  end
end

pp two_sum([2, 7, 11, 15], 9)
pp [0, 1]

puts '--'

pp two_sum([3, 3], 6)
pp [0, 1]
