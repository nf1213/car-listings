require "rails_helper"

feature "User creates a car", %q(
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot

  Acceptance Criteria:

  * I must specify the manufacturer, color, year, and mileage of the car (an association between the car and an existing manufacturer should be created).
  * Only years from 1920 and above can be specified.
  * I can optionally specify a description of the car.
  * If I enter all of the required information in the required formats, the car is recorded and I am presented with a notification of success.
  * If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  * Upon successfully creating a car, I am redirected back to the index of cars.
) do

  scenario "User provides valid information" do
    car = FactoryGirl.build(:car)
    visit new_manufacturer_car_path(car.manufacturer.id)

    fill_in "Color", with: car.color
    select car.year, from: "Year"
    fill_in "Mileage", with: car.mileage
    fill_in "Description", with: car.description

    click_on "Create Car"

    expect(page).to have_content "Car successfully created!"
    expect(page).to have_content car.manufacturer.name
    expect(page).to have_content car.description
  end

  scenario "User provides invalid information" do
    manufacturer = FactoryGirl.create(:manufacturer)
    visit new_manufacturer_car_path(manufacturer.id)

    click_on "Create Car"

    expect(page).to have_content "Colorcan't be blank"
    expect(page).not_to have_content "Descriptioncan't be blank"
  end

end
