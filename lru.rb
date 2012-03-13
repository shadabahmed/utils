class LRU
  MaxSize = 3
  Node = Struct.new(:key,:value,:left,:right)
  
  def initialize
    @head = nil
    @tail = nil
    @hash = {}
  end

  def delete_node(node)
    return if node.nil?
    left,right = node.left,node.right
    left.right = right unless left.nil?
    right.left = left unless right.nil?
    node.right,node.left = nil,nil
    @tail = left if right.nil? and left
    node
  end 
  
  def set(key,value)
    node = if @hash.key? key
              node = delete_node(@hash[key])
            else
             if @hash.size == MaxSize
              deleted_node = delete_node(@tail)
              @hash.delete deleted_node.key
              deleted_node = nil
             end
             Node.new(key)
           end
    node.value = value
    unless @head
      @head = @tail = node
    else
      node.right = @head
      @head.left = node
      @head = node
    end
    @hash[key] = node
  end

  def get(key)
    return unless @hash.key? key
    node = @hash[key]
    set(key, node.value) unless @head == node
    node.value
  end
  
  def _print
    x = @head
    until x.nil?
      print "-->#{x.value}"
      x = x.right
    end
    puts ""
    puts "Tail : #{@tail.value}"
    p @hash.map{|k,v| Hash[k,v.value]} 
  end
end

if $0 == __FILE__
  lru = LRU.new
  lru.set('1', 'one')
  lru.set('2', 'two')
  lru.set('3', 'three')
  lru.set('4', 'four')
  lru.set('5', 'five')
  lru.set('6', 'six')
  lru._print
  puts lru.get('1')
  lru._print
  puts lru.get('5')
  lru._print
end
