require "factory_girl"

FactoryGirl.define do
  factory(:manufacturer) do
    sequence(:name) { |n| "Subaru#{n}" }
    country_name "Japan"
  end

  factory(:car) do
    color "Blue"
    year 2005
    mileage 1000
    sequence(:description) {|n| "GREAT DEAL BUY NOW!!#{n}" }

    manufacturer
  end

end
