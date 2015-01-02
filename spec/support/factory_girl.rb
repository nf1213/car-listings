require "factory_girl"

FactoryGirl.define do
  factory(:manufacturer) do
    sequence(:name) { |n| "Subaru#{n}" }
    country_name "Japan"
  end

end
