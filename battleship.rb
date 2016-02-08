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
    if name
      raise ArgumentError
    end
  end
end

class ArgumentError < StandardError
  # ComputerPlayer.new("The Red Queen")
end
