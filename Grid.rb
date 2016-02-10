require './Ship.rb'
require 'byebug'

class Grid
  attr_reader :piece_of_ship
  def initialize
    @piece_of_ship = []
  end

  def display
    puts "    1   2   3   4   5   6   7   8   9   10"
    display_line
    ("A".."J").each_with_index do |l, i|
      bar = l + " |"
      y = i + 1
      (1..10).each do |x|
        bar << if has_ship_on?(x, y)
          " O |"
        else
          "   |"
        end
      end
    puts bar
    end
    display_line
  end

  private def display_line
     puts "  -----------------------------------------"
  end

  def has_ship_on?(x, y)
    @piece_of_ship.each do |s|
      return true if s.covers?(x, y)
    end
    false
  end

  def fire_at(x, y)
    return false if @piece_of_ship == []
    @piece_of_ship.each do |s|
      return true if s.covers?(x, y)
    end
    false
  end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    @piece_of_ship.each do |s|
      return false if ship.overlaps_with?(s)
    end
    true
    @piece_of_ship << ship
  end


end
