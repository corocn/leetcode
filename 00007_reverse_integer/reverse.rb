require 'minitest/autorun'

MAX = 2**31 -1
MIN = (-1) * 2**31

# @param {Integer} x
# @return {Integer}
def reverse(x)

  plus_minus = (x >= 0) ? 1 : -1
  rev = x.to_s.chars.reverse.join.to_i

  r = plus_minus * rev

  return 0 if rev < MIN || rev > MAX

  r
end


class MyTest < Minitest::Test
  def test_1
    assert_equal 321, reverse(123)
  end

  def test_2
    assert_equal -321, reverse(-123)
  end

  def test_3
    assert_equal 21, reverse(120)
  end

  def test_4
    assert_equal 0, reverse(1534236469)
  end

end
