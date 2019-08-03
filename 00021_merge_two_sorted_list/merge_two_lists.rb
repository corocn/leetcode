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
def merge_two_lists(l1, l2)
  merged_list = l1
  p = l2
  while !p.nil?
    merged_list = insert(merged_list, p.val)
    p = p.next
  end

  merged_list
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
    l1 = build_list([1, 2, 4])
    l2 = build_list([1, 3, 4])

    assert_equal  [1, 1, 2, 3, 4, 4], list_values(merge_two_lists(l1, l2))
  end

  def test_2
    l = build_list([0, 2, 4])

    assert_equal([0,1,2,4], list_values(insert(l, 1)))
    assert_equal([0,1,2,3,4], list_values(insert(l, 3)))
    assert_equal([0,1,2,3,3,4], list_values(insert(l, 3)))
    assert_equal([0,1,2,3,3,4,5], list_values(insert(l, 5)))
  end

  def test_3
    l1 = nil
    l2 = build_list([0])

    assert_equal  [0], list_values(merge_two_lists(l1, l2))
  end

  def test_4
    l1 = build_list([2])
    l2 = build_list([1])

    assert_equal  [1, 2], list_values(merge_two_lists(l1, l2))
  end

end
