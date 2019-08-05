require 'minitest/autorun'

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  longest_substring(s).length
end

def longest_substring(s)
  len = s.length

  return "" if s == ""

  wlen = len
  max_len = max_character_length(s)
  wlen = max_len if wlen > max_len

  wlen.downto(1) do |l|
    substrings =  window(s, l)

    substrings.each do |substr|
      return substr if no_repeating?(substr)
    end
  end
end

def window(s, window_length)
  len = s.length

  (0..(len - window_length)).map do |i|
    s.slice(i..(i+window_length-1))
  end
end

def no_repeating?(s)
  check_hash = {}
  s.chars.each do |c|
    return false if check_hash[c]
    check_hash[c] = true
  end
  true
end

def max_character_length(s)
  check_hash = {}
  s.chars.each do |c|
    check_hash[c] = true
  end

  check_hash.keys.length
end

class MyTest < Minitest::Test
  def test_1
    assert_equal('', longest_substring(''))
    assert_equal('abc', longest_substring('abc'))
    assert_equal('abc', longest_substring('abcabcbb'))
    assert_equal('b', longest_substring('bbbbb'))
    assert_equal('wke', longest_substring('pwwkew'))
  end
end
