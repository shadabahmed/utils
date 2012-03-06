class BST
  attr_accessor :root

  class Node
    attr_accessor :value, :left, :right
    def initialize(val)
      self.value = val
    end
  end
  
  def initialize(val)
    @root = Node.new(val)
  end

  def insert(val)
    insert_node(@root,val)
  end
  
  def delete(val)
    delete_node(@root, val)
  end
  
  def inorder
  end

  def preorder
  end
  
  def postorder
  end

  def pretty_print
    levels = Hash.new {|h,k| h[k] = []}
    populate_levels(@root, levels, 1)
    k = levels.keys.size
    p levels
    1.upto(levels.keys.size) do |i|
      print " "*2**k
      levels[i].each{|x| print "#{x} "}
      print " "*2**k
      print "\n"
      k -= 1
    end
  end
  
  def search(val)
    p search_node(@root, val)
  end
  
  def max_height
    find_height(@root)
  end  
  
  def find_succ(node)
    left_most(node.right)    
  end 
  
  def find_pred(node)
    right_most(node.left)
  end  
  
  private
  def search_node(node, val)
    return nil unless node
    node.value == val ? node : (node.value > val ? search_node(node.left, val) : search_node(node.right, val))
  end

  def delete_node(node,val)
    return nil unless node
    if node.value > val
      node.left = delete_node(node.left, val)
    elsif node.value < val
      node.right = delete_node(node.right, val)
    else
      if !node.left and !node.right
        node = nil
      elsif !node.left and node.right or node.left and !node.right
        node = node.left || node.right
      else
        value = (find_pred(node) || find_succ(node))
        delete_node(@root, value)
        node.value = value
      end
    end
    node
  end  
  
  def left_most(node)
    return nil unless node
    left_most(node.left) || node.value  
  end

  def right_most(node)
    return nil unless node
    right_most(node.right) || node.value  
  end

  def populate_levels(node, levels, level)
    levels[level] << (node && node.value || '  ')
    return unless node
    populate_levels(node.left, levels, level + 1)
    populate_levels(node.right, levels, level + 1)
  end  

  def find_height(node)
    return 0 if node.nil?
    [find_height(node.left),find_height(node.left)].max + 1
  end

  def insert_node(node,val)
    if node and node.value != val
      if node.value > val
        node.left = insert_node(node.left,val)
      else
        node.right = insert_node(node.right, val)
      end
    end
    node ||= Node.new(val)
  end  
  
end

def modify_tree_for_sub_sum(node)
  return 0 unless node
  left_val = (node && node.left && node.left.value) || 0
  right_val = (node && node.right && node.right.value) || 0
  left_sum = modify_tree_for_sub_sum(node.left)
  right_sum = modify_tree_for_sub_sum(node.right)
  node.value = left_val + right_val + left_sum + right_sum
  node.value
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

def tree_equal(node1, node2)
  (node1.nil? && node2.nil?) || (node1.value == node2.value && tree_equal(node1.left, node2.left) && tree_equal(node1.right, node2.right) 
end

def common_bst(tree1, tree2)
  return nil if tree1.nil? or tree2.nil?
  return tree1 if tree1.value == tree2.value && tree_equal(tree1.left, tree2.left) && tree_equal(tree1.right, tree2.right)
  left_common = tree1.left && common_bst(tree1.left, )
end

#tree = create_tree

#puts 'Tree'
#print_tree tree
#list_head,list_tail = convert_tree(tree)

#puts 'List'
#print_list list_head



