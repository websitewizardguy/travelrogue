require "rails_helper"
require "active_support"

feature 'User creates a ride' do
  let(:origin) { Faker::Address.street_address }
  let(:time) { Faker::Time.forward(2, :morning) }
  scenario 'with valid data' do
    visit new_ride_path
    fill_in 'Origin', with: origin
    fill_in "Destination", with: Faker::Address.street_address
    fill_in "Seat count", with: 3
    fill_in "Date", with: Faker::Date.forward(2)
    fill_in "Departure time", with: time
    fill_in "Return time", with: time + 2.hours
    click_on "Create Ride"
    expect(page).to have_content origin
  end
end
