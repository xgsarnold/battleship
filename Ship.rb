require './ComputerPlayer'
require './Positions'

class Ship
  def initialize(length)
    @length = length
    @positions = []
  end

  def length
    @length
  end

  def positions
    @positions
  end

  def place(x, y, across)
    return false if @positions != []
      length.times do |i|
        @positions << (across ? Positions.new(x+i, y) : Positions.new(x, y+i))
      end
  end

  def covers?(x, y)
    @positions.each do |i|
      return i if i.x == x && i.y == y
    end
    false
  end

  def overlaps_with?(other_ship)
    @positions.any? {|p| other_ship.covers?(p.x, p.y)}
    # @positions.each do |i|
    #   return true if other_ship.covers?(i.x, i.y)
    # end
    # false
  end

  def fire_at(x, y)
    found = covers?(x, y)
    found && found.hit!
  end

  def sunk?
    return false if @positions.empty?
    @positions.all? {|p| p.hit?}
    # sunk = true
    # @positions.each do |i|
    #   sunk = false unless i.hit?
    # end
    # sunk
  end
end
