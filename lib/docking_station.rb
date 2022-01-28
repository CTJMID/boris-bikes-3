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

    # if bike == @broken_bike
    #   "You have docked a broken bike"
    # end
   
    @bikes_in_station.each do |bike|
      if @broken_bikes.include?(bike)
        
      end
    end
  end

  def dock(bike)
    fail "Capacity is full" if self.full?
    @bikes_in_station.push(bike)  
  end

  def report_broken(bike)
    working? = false
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