require "rails_helper"

feature "User creates a manufacturer", %q(
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot

  Acceptance Criteria:

  * I must specify a manufacturer name and country.
  * If I do not specify the required information, I am presented with errors.
  * If I specify the required information, the manufacturer is recorded and I am redirected to the index of manufacturers
) do

  scenario "User provides valid attributes" do
    manufacturer = FactoryGirl.build(:manufacturer)
    visit new_manufacturer_path

    fill_in "Name", with: manufacturer.name
    fill_in "Country name", with: manufacturer.country_name

    click_on "Create Manufacturer"

    expect(page).to have_content "Manufacturer successfully created!"
    expect(page).to have_content manufacturer.name
  end

  scenario "User provides invalid attributes" do
    visit new_manufacturer_path

    click_on "Create Manufacturer"

    expect(page).to have_content "Name can't be blank"
  end
end
