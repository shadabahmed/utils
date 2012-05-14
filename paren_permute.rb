class DirectedBinaryGraphNode
  attr_accessor :last_lower, :last_higher, :next_lower, :next_higher, :x, :y
  def initialize(x,y)
    @x = x; @y = y
  end
  def to_s()
    "#{x}, #{y}"
  end
end

def validate_node(n,index)
  x = index[0]; y = index[1]
  width = x >= 0 and x <= n
  vertical = (x < (n/2)) ? x : (n-x)
  height = (y >= 0 and y <= vertical)
  x <= n and width and height
end

def ensure_node(index,n) 
  if ( @nodes[index] ) then
    node = @nodes[index]
  else
    node = DirectedBinaryGraphNode.new(index[0],index[1])
    @nodes[index] = node
    create_node(n,node)
  end
  node
end

def create_node(n,node)
  puts "creating node #{node}"
  last_lower = [node.x-1,node.y-1]
  last_higher = [node.x-1,node.y+1]
  node.last_lower = ensure_node(last_lower,n) if validate_node(n,last_lower)
  node.last_higher = ensure_node(last_higher,n) if validate_node(n,last_higher)
  next_lower = [node.x+1,node.y-1]
  next_higher = [node.x+1,node.y+1]
  node.next_lower = ensure_node(next_lower,n) if validate_node(n,next_lower)
  node.next_higher = ensure_node(next_higher,n) if validate_node(n,next_higher)
end

def create_data_structure(n)  
  @nodes[[0,0]] = DirectedBinaryGraphNode.new(0,0) 
  create_node(n,@nodes[[0,0]]) 
end

def walk_data_structure(str,last)
  if ( last.last_lower) then
    walk_data_structure("(" + str,last.last_lower)
  end
  if ( last.last_higher) then
    walk_data_structure(")" + str,last.last_higher) 
  end 
  unless last.last_lower or last.last_higher then
    @cnt = @cnt + 1
    puts "Valid combo: #{str}"
  end
end

n = ARGV[0].to_i
unless ( n % 2 == 0 ) then
  puts "invalid parameter #{n} [it must be even]"
  exit -1
end
@nodes = {}; @cnt = 0
create_data_structure(n)
walk_data_structure("",@nodes[[n,0]])
puts "Total number: #{@cnt}"
