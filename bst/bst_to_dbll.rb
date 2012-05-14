class BST
  attr_accessor :value, :left, :right
  def initialize(val)
    self.value = val
  end
end

# returns head and tail of converted list
def convert_tree(tree)
  return nil,nil if tree.nil?
  left_list_head,left_list_tail = convert_tree(tree.left)    
  right_list_head,right_list_tail = convert_tree(tree.right)
  current_head, current_tail = tree,tree
  if left_list_tail
    current_head = left_list_head
    tree.left = left_list_tail
    left_list_tail.right = tree
  end
  if right_list_head
    current_tail = right_list_tail
    tree.right = right_list_head
    right_list_head.left = tree
  end
  [current_head,current_tail]
end


def create_tree
  node_values = [4,2,6,1,3,5,7]
  nodes = node_values.collect{|i| BST.new i}
  i = 0
  while i < nodes.length/2
    node = nodes[i]
    node.left = nodes[2*i + 1]
    node.right = nodes[2*i + 2]
    i = i + 1
  end
  nodes[0]
end

def print_tree(tree)
  return unless tree
  print_tree tree.left
  puts tree.value
  print_tree tree.right
end

def print_list(list)
  while list
    puts list.value
    list = list.right
  end
end
tree = create_tree

puts 'Tree'
print_tree tree
list_head,list_tail = convert_tree(tree)

puts 'List'
print_list list_head



