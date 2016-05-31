require_relative 'inheritable_attributes.rb'

class Polygon
  include ClassLevelInheritableAttributes
  #class << self;  attr_accessor :sides end
  inheritable_attributes :sides, :coolness
  @sides = 8
  @coolness = 'Very'

=begin
    @@sides = 10
    def self.sides
      @@sides
    end
=end
end

class Triangle < Polygon
  @sides = 3
end

class Rectangle < Polygon
  @sides = 4
end

class Octogon < Polygon; end

=begin
puts Polygon.sides
puts Triangle.sides
puts Rectangle.sides

puts Polygon.class_variables
puts Polygon.instance_variables
=end

puts "Polygon.sides = #{Polygon.sides}"
puts "Triangle.sides = #{Triangle.sides}"
puts "Rectangle.sides = #{Rectangle.sides}"
puts Octogon.coolness