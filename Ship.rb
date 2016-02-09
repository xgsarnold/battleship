require './ComputerPlayer.rb'

class Ship
  def initialize(length)
    @length = length
    @positions = []
    @hit_positions = []
  end

  def length
    @length
  end

  def positions
    @positions
  end

  def place(x, y, across)
    if @positions.empty?
      if across
        (x...x+@length).each do |i|
        @positions << [i, y]
        end
      else
        (y...y+@length).each do |i|
        @positions << [x, i]
        end
      end
    else
    end
  end

  def covers?(x, y)
    @positions.include?([x, y])
  end

  def overlaps_with?(other_ship)
    @positions.each do |place|
      return true if other_ship.covers?(place[0], place[1])
    end
    false
  end

  def fire_at(x, y)
    if !@hit_positions.include?([x, y]) && covers?(x, y)
      @hit_positions << [x, y]
    else
      false
    end
  end

  def sunk?
    @hit_positions.length == @length
  end
end
