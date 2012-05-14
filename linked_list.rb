 class Node
  attr_accessor :value, :next
  def initialize(value)
    self.value = value
  end
end

def create_list(arr)
  head = node = Node.new(arr[0])
  arr[1..-1].each do |a|
    node.next = Node.new a
    node = node.next
  end
  head
end

def print_list(list)
  while list.next
    print "#{list.value}-->" 
    list = list.next
  end
  print "#{list.value}"
  print "\n"
end

l1 = create_list([4,7,9,6])
l2 = create_list([5,7])

print_list l1
print_list l2

def add_eql_lists(l1,l2)
  return 0 if l1.nil?
  carry = add_eql_lists(l1.next, l2.next)
  sum = l1.value + l2.value + carry
  l1.value = sum % 10
  carry = sum / 10
end

def add_list(l1,l2)
  l1p,l2p = l1,l2
  while l2p.next && l1p.next
    l1p = l1p.next
    l2p = l2p.next
  end
  larger_list = l1p.next ? l1 : l2
  small_list = l1p.next ? l2 : l1
  larger_list_head = l1p.next ? l1p : l2p
  l3 = Node.new larger_list.value
  while larger_list != larger_list_head
   
  end
  print_list l1p
end

def add_list(l1,l2)
  l1p,l2p = l1,l2
  s1,s2 = '',''
  while l1p
    s1 << l1p.value.to_s
    l1p = l1p.next
  end
  while l2p
    s2 << l2p.value.to_s
    l2p = l2p.next
  end
  p s1,s2
  smaller_length = [s1.size, s2.size].min
  p smaller_length
  s1n , s2n = s1[-smaller_length-1..-1],s2[-smaller_length..-1]
  s3 = (s1.size > s2.size ? s1 : s2)[0..(smaller_length - 2)]
  s3 += (s1n.to_i + s2n.to_i).to_s
  p s1n,s2n
  l3p = l3 = Node.new(s3[0].to_i)
  1.upto(s3.length) do |i|
    l3p.next = Node.new s3[i].to_i
    l3p = l3p.next  
  end
  l3
end
