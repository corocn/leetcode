require 'minitest/autorun'

# 裏技
# @param {String} s
# @return {Boolean}
# def is_valid(s)
#   return false if s.length % 2 == 1
#
#   l = s.length / 2
#
#   (1..l).each do
#     s = s.gsub(/\(\)|\[\]|\{\}/, '')
#   end
#
#   return false if s != ''
#   true
# end

SYMBOLS = {
  ')': '(',
  ']': '[',
  '}': '{',
}

# 正統派
def is_valid(s)
  chars = s.chars

  stack = []

  chars.each do |c|
    if SYMBOLS.values.include?(c)
      stack.push(c)
    elsif SYMBOLS.keys.include?(c.to_sym)
      return false if SYMBOLS[c.to_sym] != stack.pop
    else
      return false
    end
  end

  return false unless stack.empty?

  true
end

class MyTest < Minitest::Test
  def test_1
    assert_equal true, is_valid('()')
  end

  def test_2
    assert_equal true, is_valid('()[]{}')
  end

  def test_3
    assert_equal false, is_valid('(]')
  end

  def test_4
    assert_equal false, is_valid('([)]')
  end

  def test_5
    assert_equal true, is_valid('{[]}')
  end
end
