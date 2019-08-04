require 'minitest/autorun'

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  head= ListNode.new(0)
  p = l1
  q = l2

  tail = head
  carry = 0
  while !p.nil? || !q.nil?
    x = p.nil? ? 0 : p.val
    y = q.nil? ? 0 : q.val

    a = x + y + carry
    v = a % 10

    tail.next = ListNode.new(v)
    tail = tail.next

    carry = (a >= 10) ? 1 : 0

    p = p.next unless p.nil?
    q = q.next unless q.nil?
  end

  tail.next = ListNode.new(carry) if carry > 0

  head.next
end

def insert(list, val)
  return ListNode.new(val) if list.nil?

  prev = nil
  p = list
  while !p.nil?
    if p.val > val
      node = ListNode.new(val)
      node.next = p

      if prev.nil?
        return node
      else
        prev.next = node
        return list
      end
    end

    prev = p
    p = p.next
  end

  prev.next = ListNode.new(val)
  list
end

def build_list(numbers)
  list = nil
  p = nil

  numbers.each do |val|
    if list.nil?
      list = ListNode.new(val)
      p = list
    else
      p.next = ListNode.new(val)
      p = p.next
    end
  end

  list
end

def list_values(list)
  p = list

  output = []

  while !p.nil?
    output << p.val
    p = p.next
  end

  output
end


class MyTest < Minitest::Test
  def test_1
    l1 = build_list([2, 4, 3])
    l2 = build_list([5, 6, 4])

    assert_equal  [7, 0, 8], list_values(add_two_numbers(l1, l2))
  end

  def test_2
    l1 = build_list([5])
    l2 = build_list([5])

    assert_equal  [0, 1], list_values(add_two_numbers(l1, l2))
  end

  def test_3
    l1 = build_list([1])
    l2 = build_list([9, 9])

    assert_equal  [0, 0, 1], list_values(add_two_numbers(l1, l2))
  end
end
