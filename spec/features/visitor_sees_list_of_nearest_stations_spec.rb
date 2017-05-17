require 'rails_helper'

RSpec.feature "As a vistior" do
  describe "they can search for the 10 nearest electric and propane stations" do
    scenario "by zipcode" do
      VCR.use_cassette("nearest_by_zip") do
        key = ENV['NREL_KEY']

        visit '/'

        fill_in 'search', :with => '80203'
        click_on "Locate"

        expect(current_path).to eq(search_path)
        expect(page).to have_content("UDR")
        expect(page).to have_content("800 Acoma St")
        expect(page).to have_content("ELEC")
        expect(page).to have_content(0.31422)
        expect(page).to have_content("24 hours daily")
      end
    end
  end
end
