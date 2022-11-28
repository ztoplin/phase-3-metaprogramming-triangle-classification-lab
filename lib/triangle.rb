class Triangle

  attr_reader :a, :b, :c 

  def initialize(a_length, b_length, c_length)
    @a = a_length
    @b = b_length
    @c = c_length
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c 
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    [a, b, c].all?(&:positive?)
  end

  def valid_triangle_inequality?
    a + b > c && a + c > b && b + c > a
  end
  
  def validate_triangle 
    raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
  end

  class TriangleError < StandardError 
  end

end

# class Triangle
#   attr_reader :a, :b, :c
  
#   def initialize(a, b, c)
#     @a = a
#     @b = b
#     @c = c
#   end

#   def kind
#     validate_triangle
#     if a == b && b == c
#       :equilateral
#     elsif a == b || b == c || a == c
#       :isosceles
#     else
#       :scalene
#     end
#   end

#   def sides_greater_than_zero?
#     [a, b, c].all?(&:positive?)
#   end

#   def valid_triangle_inequality?
#     a + b > c && a + c > b && b + c > a
#   end

#   def validate_triangle
#     raise TriangleError unless sides_greater_than_zero? && valid_triangle_inequality?
#   end

#   class TriangleError < StandardError
#   end

# end
