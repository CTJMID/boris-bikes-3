require 'docking_station'

describe DockingStation do
  
  it {is_expected.to respond_to :release_bike}
  
  # it {is_expected.to respond_to :Bike.new}
  # subject { Bike.new }
  it "releases working bikes" do
    bike = Bike.new
    subject.dock(bike)
    # bike = subject.release_bike
    expect(subject.release_bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes_in_station) } 

  it "accepts a docked bike" do
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
    20.times { subject.dock(Bike.new) }
    expect { subject.dock(Bike.new) }.to raise_error "Capacity is full"
  end

end