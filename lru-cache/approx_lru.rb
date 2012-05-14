require './lru'
module LRUCache
  class ApproxCache < Cache
    # Override the get method
    # This will speed up concurrent cache access
    # since no synchronization is required as LRU state
    # is not modified. Only issue with this is, least recent
    # would not be deleted as we approach max_size
    def get(key)
      node = get_node(key)
      return nil unless node
      node.value
    end
  end
end
