require 'minitest/autorun'

# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  return false if x < 0
  r = x.to_s.chars.reverse.join.to_i
  x == r
end


class MyTest < Minitest::Test
  def test_1
    assert_equal true, is_palindrome(121)
  end

  def test_2
    assert_equal false, is_palindrome(-121)
  end

  def test_3
    assert_equal false, is_palindrome(10)
  end
end
