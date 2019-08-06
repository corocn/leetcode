require 'minitest/autorun'

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  merged = []
  while nums1.length > 0 || nums2.length > 0
    if nums1.length > 0 && nums2.length > 0
      if nums1.first < nums2.first
        merged << nums1.shift
      else
        merged << nums2.shift
      end
    elsif nums1.length > 0
      merged += nums1
      nums1 = []
    elsif nums2.length > 0
      merged += nums2
      nums2 = []
    end
  end

  l = merged.length
  if l.even?
    (merged[l/2 - 1] + merged[l/2]) / 2.0
  else
    merged[l/2].to_f
  end
end

class MyTest < Minitest::Test
  def test_1
    assert_equal(2.0, find_median_sorted_arrays([1, 3], [2]))
    assert_equal(2.5, find_median_sorted_arrays([1, 2], [3, 4]))
  end
end
