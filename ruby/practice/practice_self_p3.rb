def m
  puts "self is #{self}"
end

m

class C
  puts "Started class C, self is #{self}"

  def self.m
    puts "self is #{self}"
  end

  def m
    puts "self is #{self}"
  end
end

C.m

C.new.m

module M
  def self.m
    puts "Module M, self is #{self}"
  end
end

M.m

