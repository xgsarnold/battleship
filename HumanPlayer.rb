require './Player.rb'

class HumanPlayer < Player
  def initialize(name = "Dave")
    @name = name
  end

  def name
    @name
  end
end
