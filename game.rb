class Game < Player
  attr_reader :name

  def initialize(humans, computer)

  super()

  @humans = humans
  @computer = computer

  end

  def welcome
    puts "Welcome, #{@humans.name} and HAL 9000!"
    puts "It's time to play Battleship."
  end

  def place_ships
    @humans.place_ships([ 2, 3, 3, 4, 5])
    @computer.place_ships([ 2, 3, 3, 4, 5])
  end

  def display_status
    # @humans.grid.display doesnt work, grid not populated yet.
    # byebug
  end
end
