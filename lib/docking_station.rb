require_relative 'bike'

class DockingStation

  attr_reader :bikes_in_station
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes_in_station = []
    @broken_bikes = []
  end
  
  def release_bike
    fail 'There are no bikes' if self.empty?
    working_bikes = []
    @bikes_in_station.each do |bike|
      unless @broken_bikes.include?(bike)
      working_bikes << bike
      end
    end
    working_bikes.pop
  end

  def dock(bike)
    fail "Capacity is full" if self.full?
    @bikes_in_station.push(bike)  
  end

  def report_broken(bike)
    #working? = false
    @broken_bikes << bike
  end

  private

  def full?
    if @bikes_in_station.length >= DEFAULT_CAPACITY
    true
    end
  end

  def empty?
    if @bikes_in_station == []
    true
    end
  end

end