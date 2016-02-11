require './Ship.rb'
require 'byebug'

class Grid
  attr_reader :ships
  def initialize
    @ships = []
  end

  def display
    puts "    1   2   3   4   5   6   7   8   9   10"
    display_line
    ("A".."J").each_with_index do |l, i|
      row = l + " |"
      y = i + 1
      (1..10).each do |x|
        ship = has_ship_on?(x, y)
        row <<  if ship && ship.hit_on?(x, y)
                  " X |"
                elsif has_ship_on?(x, y)
                  " O |"
                else
                  "   |"
                end
      end
    puts row
    end
    display_line
  end

  private def display_line
     puts "  -----------------------------------------"
  end

  def x_of(coordinates)
    coordinates[1..-1].to_i
  end

  def y_of(coordinates)
    coordinates[0].ord - "A".ord + 1
  end


  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    @ships.each do |s|
      return false if ship.overlaps_with?(s)
    end
    @ships << ship
    ship
  end

  def has_ship_on?(x, y)
    # @ships.any? {|s| s.covers?(x, y)}
    @ships.each do |ship|
      return ship if ship.covers?(x, y)
    end
    false
  end

  def fire_at(x, y)
    ship = has_ship_on?(x, y)
    if ship
      ship.fire_at(x, y)
    else
      false
    end
  end

  def sunk?
    @ships.any? {|ship| ship.sunk?}
  end
end
