# Sample use:
# Initialize a bitfield with max size
# b = BitField.new(32768)
# Add numbers
# b.add(5)
# b.add(16768)
# Find Numbers
# b.has?(5)
# Print the internal state of BitField
# b.print
# Print the list of numbers
# b.print_list

class BitField
  MaxBytes = 1.size
  MaxBits = MaxBytes * 8
  BitMask = MaxBits - 1
  BitsInMask = BitMask.to_s(2).size

  attr_accessor :arr

  def initialize(max_n)
    @arr = [0]*(max_n/MaxBits + 1)
  end
  
  def position(i)
    return [i>>BitsInMask,BitMask & i]
  end  

  def add(i)
    slot,bit_index = position(i)
    @arr[slot] |= (1 << bit_index)
  end
  
  def has?(i)
    slot,bit_index = position(i)
    (@arr[slot] & (1 << bit_index)) != 0
  end

  def print
    @arr.each_with_index{|i,index| puts "At slot #{index} : #{"%0#{BitMask}b" % i}" unless i == 0}
    nil
  end

  def print_list
    @arr.each_with_index do |a,i|
      base = i << BitsInMask
      if a > 0
        (0...MaxBits).each  do |y|
          num_pos = (a & 1 << y)
          next if num_pos == 0 
          num = 0
          while num_pos > 1
            num += 1
            num_pos >>= 1
          end
          puts base + num
        end
      end
    end
    nil
  end
end

