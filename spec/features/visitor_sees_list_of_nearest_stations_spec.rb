require 'rails_helper'

RSpec.feature "As a vistior" do
  describe "they can search for the 10 nearest electric and propane stations" do
    scenario "by zipcode" do
      VCR.use_cassette("nearest_by_zip") do
        key = ENV['NREL_KEY']

        visit '/'

        fill_in 'q', :with => '80203'
        click_on "Locate"

        expect(current_path).to eq(search_path)
        expect(page).to have_content("UDR")
        expect(page).to have_content("800 Acoma St")
        expect(page).to have_content("ELEC")
        expect(page).to have_content(0.31422)
        expect(page).to have_content("24 hours daily")


      # As a user
      # When I visit "/"
      # And I fill in the search form with 80203
      # And I click "Locate"
      # Then I should be on page "/search" with parameters visible in the url
      # Then I should see a list of the 10 closest stations within 6 miles sorted by distance
      # And the stations should be limited to Electric and Propane
      # And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times
      end
    end
  end
end
