require 'minitest/autorun'

# @param {String} s
# @param {Integer} num_rows
# @return {String}
def convert(s, num_rows)
  lines  = Array.new(num_rows) { [] }

  r = 0
  d = 1
  s.chars.each do |c|
    lines[r] << c

    if num_rows > 1
      d = 1 if r == 0
      d = -1 if r == num_rows - 1

      r = r + d
    end
  end

  lines.flatten.join
end

class MyTest < Minitest::Test
  def test_1
    assert_equal 'PAHNAPLSIIGYIR', convert('PAYPALISHIRING', 3)
  end

  def test_2
    assert_equal 'PINALSIGYAHRPI', convert('PAYPALISHIRING', 4)
  end

  def test_3
    assert_equal 'ABC', convert('ABC', 1)
  end
end
