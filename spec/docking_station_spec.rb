require 'docking_station'

describe DockingStation do
  
  it {is_expected.to respond_to :release_bike}
  
  it "releases working bikes" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes_in_station) } 

  it "accepts a bike and docks it" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes_in_station).to eq [bike]
  end

  it "returns a docked bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it "gives an error when there are no bikes" do
    expect { subject.release_bike }.to raise_error 'There are no bikes'
  end

  it "gives an error when docking station capacity is full" do
    DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
    expect { subject.dock(Bike.new) }.to raise_error "Capacity is full"
  end

  it "allows a capacity to be set when a docking station is created" do
    expect(DockingStation.new(30)).to be_truthy
  end

  it "gives a default capacity of 20 when no other capacity is given" do 
    expect(subject.capacity).to eq(20)
  end

    it { is_expected.to respond_to(:report_broken).with(1).argument }
  
  it "doesn't release a bike that is broken" do
    broken_bike = Bike.new
    subject.report_broken(broken_bike)
    subject.dock(broken_bike)
    expect(subject.release_bike).to eq nil
  end
  
end