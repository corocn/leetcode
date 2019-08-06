require 'minitest/autorun'

# @param {String} s
# @return {String}
def longest_palindrome(s)
  return "" if s == ''

  max_len = s.length

  max_len.downto(1).each do |l|
    strs =  window(s, l)

    strs.each do |str|
      return str if palindrome?(str)
    end
  end
end

def palindrome?(s)
  len = s.length
  chars = s.chars

  return true if len == 1
  return chars[0] == chars[1] if len == 2

  p1, p2 = starts(len)

  while p1 >= 0
    return false if chars[p1] != chars[p2]
    p1 -= 1
    p2 += 1
  end

  true
end

def starts(len)
  if len.even?
    [len / 2 - 1, len / 2]
  else
    center = len / 2
    [center - 1, center + 1]
  end
end

def window(s, window_length)
  len = s.length

  (0..(len - window_length)).map do |i|
    s.slice(i..(i+window_length-1))
  end
end

class MyTest < Minitest::Test
  def test_0
    assert_equal false, palindrome?('abc')
    assert_equal true, palindrome?('aba')
    assert_equal false, palindrome?('abab')
    assert_equal true, palindrome?('aa')
    assert_equal true, palindrome?('a')
  end

  def test_1
    assert_equal 'bab', longest_palindrome('babad')
    assert_equal 'bb', longest_palindrome('cbbd')
    assert_equal '', longest_palindrome('')
  end

  def test_2
    s = "civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"
    assert_equal 'ranynar', longest_palindrome(s)
  end
end
