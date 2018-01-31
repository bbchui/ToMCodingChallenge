class Cuboid
  attr_accessor :origin, :leng, :width, :height

  # Assuming cuboid cannot have a negative length, width, height
  def initialize(origin, width, height, leng)
    raise 'Length, width, and height must be greater than Zero' if [leng, width, height].any? {|num| num <= 0}

    @origin = origin
    @width = width # x-axis
    @height = height # y-axis
    @leng = leng # z-axis
  end
  #BEGIN public methods that should be your starting point

  def move_to!(x, y, z)
    raise 'Cuboid already at this origin' if @origin == [x,y,z]
    @origin = [x,y,z]
  end

  def vertices
    {
      :bbl => @origin, #back-bottom-left
      :bbr => [@origin[0] + @width, @origin[1], @origin[2]], #back-bottom-right
      :fbl => [@origin[0], @origin[1], @origin[2] + @leng], #front-bottom-left
      :fbr => [@origin[0] + @width, @origin[1], @origin[2] + @leng], #front-bottom-right
      :btl => [@origin[0], @origin[1] + @height, @origin[2]], #back-top-left
      :btr => [@origin[0] + @width, @origin[1] + @height, @origin[2]], #back-top-right
      :ftl => [@origin[0], @origin[1] + @height, @origin[2] + @leng], #front-top-left
      :ftr => [@origin[0] + @width, @origin[1] + @height, @origin[2] + @leng] #front-top-right
    }
  end

  #returns true if the two cuboids intersect each other.  False otherwise.
  def intersects?(other)
    x_axis_start = [self.vertices[:bbl][0], other.vertices[:bbl][0]].max
    x_axis_end = [self.vertices[:bbr][0], other.vertices[:bbr][0]].min

    y_axis_start = [self.vertices[:bbl][1], other.vertices[:bbl][1]].max
    y_axis_end = [self.vertices[:btl][1], other.vertices[:btl][1]].min

    z_axis_start = [self.vertices[:bbl][2], other.vertices[:bbl][2]].max
    z_axis_end = [self.vertices[:fbl][2], other.vertices[:fbl][2]].min

    #If any of the conditions below return true, there is an overlap on that axis.
    #Assuming that if one or two axis return true, the cuboids are stacked next to each other on those axis.
    #If all three conditions return true, there is an intersection between the two cuboids.
    (x_axis_end > x_axis_start) && (y_axis_end > y_axis_start) && (y_axis_end > y_axis_start)
  end

  def rotate_x_axis #rotate around the width
    @leng, @height = @height, @leng
  end

  def rotate_y_axis #rotate around the height
    @leng, @width = @width, @leng
  end

  def rotate_z_axis #rotate around the length
    @width, @height = @height, @width
  end


  #END public methods that should be your starting point
end

# cube = Cuboid.new([0,0,0],1,1,1)
# cube2 = Cuboid.new([3,4,5],1,1,1)
