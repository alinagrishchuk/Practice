class A
  def hello_and_bye
    hello
    self.bye
  end

  def hello
    puts "Hello!"
  end

  def bye
    puts "Bye!"
  end
end

class B
  def id_and_class
    puts "id: #{object_id} | class: #{self.class}"
  end
end

class C
  def self.self
    self
  end
end

A.new.hello_and_bye
B.new.id_and_class
p C.self