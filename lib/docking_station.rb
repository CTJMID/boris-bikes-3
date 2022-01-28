require_relative 'bike'

class DockingStation

  attr_reader :bikes_in_station
  
  def initialize
    @bikes_in_station = []
  end
  
  def release_bike
    fail 'There are no bikes' if self.empty?
    @bikes_in_station.pop
  end

  def dock(bike)
    fail "Capacity is full" if self.full?
    @bikes_in_station.push(bike)   
  end

  private

  def full?
    if @bikes_in_station.length >= 20
    true
    end
  end

  def empty?
    if @bikes_in_station == []
    true
    end
  end

end