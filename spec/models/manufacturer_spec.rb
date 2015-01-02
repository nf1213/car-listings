require "rails_helper"

RSpec.describe Manufacturer do
  it { should have_many(:cars) }

  it { should have_valid(:name).when("some text", ("a"*140))}
  it { should_not have_valid(:name).when("", nil)}
  it { should validate_uniqueness_of(:name)}

  it { should have_valid(:country_name).when("some text", ("a"*140))}
  it { should_not have_valid(:country_name).when("", nil)}
end
