class Player
end

class HumanPlayer < Player
  def initialize(name = "Dave")
    @name = name
  end

  def name
    @name
  end

end

class ComputerPlayer < Player
  def initialize(name = "HAL 9000")
    @name = name
    unless name == "HAL 9000"
      raise ArgumentError
    end
  end

  def name
    @name
  end

end

class ArgumentError < StandardError
  # ComputerPlayer.new("The Red Queen")
end

class Ship
  def initialize(length)
    @length = length
    @positions = []
    @hit_positions = []
  end

  def length
    @length
  end

  def positions
    @positions
  end

  def place(x, y, across)
    if @positions.empty?
      if across
        (x...x+@length).each do |i|
        @positions << [i, y]
        end
      else
        (y...y+@length).each do |i|
        @positions << [x, i]
        end
      end
    else
    end
  end

  def covers?(x, y)
    @positions.include?([x, y])
  end

  def overlaps_with?(other_ship)
    @positions.each do |place|
      return true if other_ship.covers?(place[0], place[1])
    end
    false
  end

  def fire_at(x, y)
    if !@hit_positions.include?([x, y]) && covers?(x, y)
      @hit_positions << [x, y]
    else
      false
    end
  end

  def sunk?
    @hit_positions.length == @length
  end
end

class Grid
  def initialize
    @grid = []
  end

  def display
    puts "    1   2   3   4   5   6   7   8   9   10
  -----------------------------------------
A |   |   |   |   |   |   |   |   |   |   |
B |   |   |   |   |   |   |   |   |   |   |
C |   |   |   |   |   |   |   |   |   |   |
D |   |   |   |   |   |   |   |   |   |   |
E |   |   |   |   |   |   |   |   |   |   |
F |   |   |   |   |   |   |   |   |   |   |
G |   |   |   |   |   |   |   |   |   |   |
H |   |   |   |   |   |   |   |   |   |   |
I |   |   |   |   |   |   |   |   |   |   |
J |   |   |   |   |   |   |   |   |   |   |
  -----------------------------------------"
  end

  def has_ship_on?(x, y)
    @grid.include?([x, y])
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    @grid << @positions
  end

end

# def test_18_place_ship
#   grid = Grid.new
#   assert grid.place_ship(Ship.new(4), 3, 3, true)
#   refute grid.has_ship_on?(2, 3)
#   assert grid.has_ship_on?(3, 3)
#   assert grid.has_ship_on?(4, 3)
#   assert grid.has_ship_on?(6, 3)
#   refute grid.has_ship_on?(7, 3)
#   refute grid.has_ship_on?(5, 4)


# class Positions
#   def initialize
#   end
# end
