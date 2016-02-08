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
  end

  def length
    @length
  end
end
