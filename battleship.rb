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
    if @hit_positions.empty?
      if @positions.include?([x, y])
        @hit_positions << [x, y]
      else
        false
      end
    else
      false
    end
  end
end
