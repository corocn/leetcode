require 'minitest/autorun'

class Memory
  attr_accessor :pos_i, :pos_j, :length

  def initialize()
    @length = -1
    @pos_i = -1
    @pos_j = -1
  end

  def update(i, j)
    l = (j - i).abs + 1

    if l > @length
      @pos_i = i
      @pos_j = j
      @length = l
    end
  end
end

# @param {String} s
# @return {String}
def longest_palindrome(s)
  return '' if s == ''

  m = Memory.new

  chars = s.chars
  len = s.length
  str = Array.new(len).map { Array.new(len) }

  max_index = len - 1
  (0..max_index).each do |n|
    (0..(max_index-n)).each do |i|
      j = i + n

      if n == 0
        str[i][j] = true
      elsif n == 1
        str[i][j] = chars[i] == chars[j]
      else
        str[i][j] = chars[i] == chars[j] && str[i+1][j-1]
      end

      m.update(i, j) if str[i][j]
    end
  end

  s.slice(m.pos_i..m.pos_j)
end

class MyTest < Minitest::Test
  def test_1
    assert_equal 'bb', longest_palindrome('cbbd')
    assert_equal 'bab', longest_palindrome('babad')
    assert_equal 'abcdedcba', longest_palindrome('abcdedcba')
    assert_equal '', longest_palindrome('')
  end

  def test_2
    s = "civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"
    assert_equal 'ranynar', longest_palindrome(s)
  end
end
