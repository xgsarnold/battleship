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
  end

  def length
    @length
  end

  def place(x, y, across)
    if across
      (x...x+@length).each do |i|
      @positions << [i, y]
      end
    else
      (y...y+@length).each do |i|
      @positions << [x, i]
      end
    end
  end

  def covers?(x, y)
    @positions.include?([x, y])
  end
end
