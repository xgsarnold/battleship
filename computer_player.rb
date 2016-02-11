require './player'

class ComputerPlayer < Player
  def initialize
   super()
  end

  def name
    "HAL 9000"
  end

  def place_ships(lengths)
    ship_number = 0
    while(ship_number < lengths.length)
      len = lengths[ship_number]
      coordinates = (65 + rand(10)).chr
      direction = [true, false].sample
        if grid.place_ship(Ship.new(len), grid.x_of(coordinates),
                           grid.y_of(coordinates), direction)
        ship_number += 1
        end
    end
    puts "HAL 9000 has placed its ships."
  end

  def call_shot
    "A1"
    # y = (65 + rand(10)).chr
    # ("A".."J").include?(computer_shot[0])
    # x =
  end

end
