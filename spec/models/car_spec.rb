require "rails_helper"

RSpec.describe Car do
  it { should belong_to(:manufacturer) }

  it { should have_valid(:manufacturer).when(Manufacturer.new) }
  it { should_not have_valid(:manufacturer).when(nil) }

  it { should have_valid(:color).when("Blue")}
  it { should_not have_valid(:color).when("", nil)}

  it { should have_valid(:year).when(2000, 1920, 2015)}
  it { should_not have_valid(:year).when(1919, 2016, nil, "string")}

  it { should have_valid(:mileage).when(100, 1234)}
  it { should_not have_valid(:mileage).when(nil, "string")}
end
