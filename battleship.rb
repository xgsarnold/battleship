class Player
end

class HumanPlayer < Player
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

end

class ComputerPlayer < Player
end
