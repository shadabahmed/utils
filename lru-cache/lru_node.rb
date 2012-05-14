module LRUCache
  class Node

    attr_accessor :left, :right, :value, :ttl
    attr_reader :key

    def initialize(key, value = nil, ttl = nil)
      @key, @value, @ttl = key, value, ttl
      set_timestamp
      self
    end
    
    def expired?
      @ttl && (Time.now.to_i - @timestamp) > @ttl
    end  
    
    # sets the last modified timestamp
    def ttl=(ttl)
      @ttl = ttl
      set_timestamp
    end

    private
      
    def set_timestamp
      @timestamp = Time.now.to_i
    end  
  end

end
