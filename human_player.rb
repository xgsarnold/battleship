require './player'

class HumanPlayer < Player
  attr_accessor :name
  def initialize(name = "Dave")
    @name = name
    super()
  end


  def place_ships(lengths)
    ship_number = 0
    while(ship_number < lengths.length)
      len = lengths[ship_number]
      puts "#{name}, where would you like to place a ship of length #{len}?"
      coordinates = get_user_input
      puts "Across or Down?"
      direction = get_user_input

      if grid.place_ship(Ship.new(len), grid.x_of(coordinates),
                       grid.y_of(coordinates), direction=="Across")
        ship_number += 1
      else
        puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again."
      end
    end

    def call_shot
      puts "#{name}, please enter the coordinates for your next shot (e.g. 'B10'):"
      return "G10"
      # coordinates = get_user_input
      # x = grid.x_of(coordinates)
      # y = grid.y_of(coordinates)
      # (y, x)
      # "#{y}#{x}"
    end

      # or we tried this, but understand now why you have that counter to make it reprompt the questions.

      # x.each do |l|
      #   puts "#{@name}, where would you like to place a ship of length #{l}?"
      #   coordinates = get_user_input
      #   puts "Across or Down?"
      #   direction = get_user_input
      #     until grid.place_ship(Ship.new(l), grid.x_of(coordinates), grid.y_of(coordinates), direction == "Across")
      #     puts "Unfortunately, that ship overlaps with one of your other ships.  Please try again.\n"
      #     end
      # end
  end


end
