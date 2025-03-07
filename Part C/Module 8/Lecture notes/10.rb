# Subclassing

class Point
  attr_accessor :x, :y # defines methods x, y, x=, y=

  def initialize (x,y)
    @x = x
    @y = y
  end
  def distFromOrigin
    Math.sqrt(@x *@x + @y*@y) # uses instance variables
  end
  def distFromOrigin2
    Math.sqrt(x*x + y*y) # uses getter methods
  end

end

class ColorPoint < Point
  attr_accessor :color

  def initialize (x,y,c="clear")
    super(x,y) #keyword super calls same method in superclass
    @color =c
  end
end

cp = ColorPoint.new(1,2,"black")
puts cp
puts cp.x
puts cp.y
puts cp.color

cp2 = ColorPoint.new(4,21)
puts cp2.color

cp3 = Point.new(0,0)
cp4 = ColorPoint.new(0,0,"red")
puts cp3.class
puts cp4.class

puts cp4.class.superclass

puts cp3.is_a? Point
puts cp4.is_a? Point
puts cp4.is_a? ColorPoint
puts cp.instance_of? Point

#Why use subclassing?

#Subclassing alternatives

#Overwriting - risky, messy, can mess up other uses, also add potentiality unneeded data
class Point2
  attr_accessor :color
  def initialize (x,y,c="clear")
    @x = x
    @y = y
    @color = c
  end
end

#Copy/paste methods
#Not good - no code reuse


#Point as an instance variable
#Non convenient for code reuse
#ColorPoint is not a Point
class ColorPoint2
  attr_accessor :color
  def initialize (x,y,c="clear")
    @pt = Point.new(x,y)
    @color = c
  end
  #Forwarding methods
  def x
    @pt.x
  end
  def y
    @pt.y
  end

  def x= v
    @pt.x = v
  end
 
end
