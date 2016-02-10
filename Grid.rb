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
      row = l + " |"
      y = i + 1
      (1..10).each do |x|
        ship = has_ship_on?(x, y)
        row << if ship && ship.hit_on?(x, y)
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

  def has_ship_on?(x, y)
    # @piece_of_ship.any? {|s| s.covers?(x, y)}
    @piece_of_ship.each do |ship|
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
    @piece_of_ship.any? {|ship| ship.sunk?}
  end


  # def fire_at(x, y)
  #   @piece_of_ship.each do |s|
  #     @found = s.covers?(x, y)
  #   end
  #   @found && @found.hit!
  # end
  #
  # def fire_at(x, y)
  #   @piece_of_ship.each do |s|
  #     found += s.covers?(x, y)
  #   end
  #
  #   found.each do |p|
  #     p.hit!
  #   end


  # def fire_at(x, y)
  #   @ships.each do |s|
  #     position = s.fire_at(x, y)
  #     @fired_at < [x, y] if s.covers?(x, y)
  #     return position
  #   end
  #   false
  # end

  def place_ship(ship, x, y, across)
    ship.place(x, y, across)
    @piece_of_ship.each do |s|
      return false if ship.overlaps_with?(s)
    end
    true
    @piece_of_ship << ship
  end


end
