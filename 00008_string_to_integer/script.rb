require 'minitest/autorun'

MAX = 2**31 -1
MIN = (-1) * 2**31

# @param {String} str
# @return {Integer}
def my_atoi(str)
  str.strip!
  matches = str.match(/^([+-]?[0-9]+).*/)
  return 0 if matches.nil?

  num = matches[1]
  num = num.to_i

  return MIN if num < MIN
  return MAX if num > MAX

  num
end


class MyTest < Minitest::Test
  def test_1
    assert_equal 42, my_atoi("42")
  end

  def test_2
    assert_equal -42, my_atoi("   -42")
  end

  def test_3
    assert_equal 4193, my_atoi("4193 with words")
  end

  def test_4
    assert_equal 0, my_atoi("words and 987")
  end

  def test_5
    assert_equal MIN, my_atoi("-91283472332")
  end

  def test_6
    assert_equal 123, my_atoi("+123")
  end
end
