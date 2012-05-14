
def find_celeb(n)
  relationships = Hash.new{|h,k| h[k] = false}

  relationship = [[1,2],[1,3],[1,4],[2,3],[2,3],[2,4],[3,4],[5,4],[5,4]]

  relationship.each do |x|
    relationships[x] = true
  end
  loop = 0
  set = (1..n).to_a
  x = set.pop
  index = 0
  unless set.empty?
    index = 0
    loop do
      loop += 1
      y = set[index]
      if relationships[[x,y]]
        x = y
        set.delete(y)
        break;
      else
        index += 1
      end
    end
    
  end
  puts loop
  puts x
  
end

find_celeb(5)


