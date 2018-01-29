
class Cuboid
  def initialize(x, y, z, length, width, height)
    @origin = [x,y,z]
    @length = length # x-axis
    @width = width # z-axis
    @height = height # y-axis
  end
  #BEGIN public methods that should be your starting point

  def move_to!(x, y, z)
  end

  def vertices
    bbl = @origin #back-bottom-left
    bbr = [x + @length, y, z] #back-bottom-right
    fbl = [x, y, z + @width] #front-bottom-left
    fbr = [x + @length, y, z + @width] #front-bottom-right
    
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
  end

  #END public methods that should be your starting point
end
