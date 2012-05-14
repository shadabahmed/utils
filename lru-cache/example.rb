require './lru'
require './approx_lru'

[LRUCache::Cache.new(10),LRUCache::ApproxCache.new(10)].each do |cache|
  puts "\nBehaviour of  #{cache.class}"
  1.upto(11) do |i|
    cache.put i.to_s.to_sym, i
  end
  puts "\nValue at key :\"2\" -> #{cache.get(:"2")}"
  puts "\nValue at key :\"1\" -> #{cache.get(:"1") || "nil"}"
  puts "Cache state : "
  cache.print
  puts "\nValue at key :\"3\" -> #{cache.get(:"3")}"
  puts "Cache state : "
  cache.print
  puts "\nValue at key :\"7\" -> #{cache.get(:"7")}"
  puts "Cache state : "
  cache.print
  puts "Putting 20 at :\"20\" with ttl of 2 seconds"
  cache.put(:"20", 20, 2)
  puts "Cache state : "
  cache.print
  puts "\nValue at key :\"20\" -> #{cache.get(:"20")}"
  puts "\nSleep for 3 seconds ..."
  sleep(3)
  puts "\nValue at key :\"20\" -> #{cache.get(:"20") || "nil"}"
  puts "Cache state : "
  cache.print
end

