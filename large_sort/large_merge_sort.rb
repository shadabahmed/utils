require 'fileutils'
MAX_MEM = 1000

class File
  def buff_read(n)
    until self.eof
       a = []
       a << self.gets until a.size == n or self.eof
      yield a
    end
  end
  
  def self.buff_read(f1,f2,n)
    a,b = [],[]
    until f1.eof and f2.eof and a.empty? and b.empty?
      a << f1.gets until f1.eof or a.size == n
      b << f2.gets until f2.eof or b.size == n
      yield a,b
    end
  end
end

def merge_arr(a,b,n)
  c = []
  until c.size == n or (a.empty? and b.empty?)
    arr = (a.empty? ? b : (b.empty? ? a : (a[0].to_i < b[0].to_i ? a : b)))
    c << arr.shift
  end
  c
end

def sort()
  index = 0
  File.open('numbers.txt').buff_read(MAX_MEM) do |lines|
    lines.sort!{|a,b|  a.to_i <=> b.to_i}
    File.open("#{index += 1}.part", "w") do |f2|
      f2.write lines.join
    end
  end
end


def merge
  until Dir.glob('*.part').size == 1
    Dir.glob("*.part").each_slice(2) do |x|
      if x.size == 1
        FileUtils.cp(x[0],"#{x[0]}.part")
      else
        f =File.open("#{x[0]}.part","w")
        f1,f2 = x.map{|name| File.open(name)}
        File.buff_read(f1,f2,MAX_MEM) do |lines1,lines2|
          f.write merge_arr(lines1,lines2,MAX_MEM).join
        end
        [f,f1,f2].each &:close
      end
      FileUtils.rm(x)
    end
  end
end

sort
merge
