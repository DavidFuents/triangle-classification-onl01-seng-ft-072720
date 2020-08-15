require "pry"

class Triangle
  attr_accessor :side_, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
    @sides = [side_a, side_b, side_c]
  end

  def kind 
    if @sides.any?(0) 
      raise TriangleError
    elsif (@side_a + @side_b <= @side_c) || (@side_a + @side_c <= @side_b) || (@side_b + @side_c <= @side_a)
      raise TriangleError
    else
      equal_sides = @sides.uniq.length
      if equal_sides == 1 
        :equilateral 
      elsif equal_sides == 2 
        :isosceles
      elsif equal_sides == 3 
        :scalene 
      end
    end
  end

  class TriangleError < StandardError
    def message
      "This is not a triangle. Please check the length of the sides again."
    end
  end
end
