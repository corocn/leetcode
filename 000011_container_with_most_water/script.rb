require 'minitest/autorun'

# @param {Integer[]} height
# @return {Integer}
def max_area(height)
  return 0 if height.length == 0

  max = 0
  left = 0
  right = height.length - 1

  while left != right
    l1 = height[left]
    l2 = height[right]

    w = right - left
    h = l2 > l1 ? l1 : l2
    v = w * h

    if v > max
      max = v
    end

    if l1 < l2
      left += 1
    else
      right -= 1
    end
  end

  max
end


class MyTest < Minitest::Test
  def test_1
    assert_equal 49, max_area([1,8,6,2,5,4,8,3,7])
    assert_equal 36, max_area([2,3,10,5,7,8,9])
  end
end
