require_relative './lru_node'
require 'thread'

module LRUCache
  class Cache
    MaxSize = 10
    
    def initialize(max_size = MaxSize)
      @head = nil
      @tail = nil
      @hash = {}
      @sem = Mutex.new
      @max_size = max_size
    end

    def put(key, value, ttl = nil)
      # delete the tail if its a new key and hash size is max
      if !@hash.key?(key) and @hash.size == @max_size
        delete_key(@tail.key)
        delete_node(@tail) 
      end
      # get or create a new node
      node = get_node(key, true)
      # set value and ttl in case they have changed
      node.value, node.ttl = value, ttl
      # set the hash key in thread safe manner
      set_key(key, node)
      # move this node to head to make it most recent
      move_to_head(node)
    end

    def get(key)
      node = get_node(key)
      return nil unless node
      # move this node to head to make it most recent
      move_to_head(node)
      node.value
    end

    def remove(key)
      node = delete_key(key)
      delete_node(node)
    end
    
    # Pretty prints the current state of the cache. First prints the linked list and then the hash
    # with keys -> value pairs
    def print
      x = @head
      until x.nil?
        super "-->#{x.value}"
        x = x.right
      end
      puts ""
      @hash.each{|k,v| super " #{k.inspect} => #{v.value} "} and nil
      puts ""
    end

    private
    
    def delete_key(key)
      @sem.synchronize{ @hash.delete(key) }
    end

    def set_key(key, value)
      @sem.synchronize{ @hash[key] = value }
    end
    
    # deletes an existing node from the list
    def delete_node(node)
      return unless node
      @sem.synchronize do
        left, right = node.left, node.right
        left.nil? ? @head = right : left.right = right
        right.nil? ? @tail = left : right.left = left
      end
      node.right,node.left = nil,nil
      node
    end 
    
    # gets a new node or an existing node and moves that to the head
    def get_node(key, create = false)
      node = @hash[key]
      if node and node.expired?
        remove(key)
        node = nil
      end
      node ||= Node.new(key) if create
      node
    end
    
    # moves a node to the head
    def move_to_head(node)
      return node if node.nil? or node == @head
      # Only delete the node when it is not a new node
      # Node is new node when its left and right are not assigned
      # and it is not head (checked above)
      node = delete_node(node) if node.left or node.right
      @sem.synchronize do
        node.right = @head
        @head.left = node if @head
        @head = node
        @tail = @head unless @tail
      end
    end

  end
end

