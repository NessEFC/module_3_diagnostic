require 'rails_helper'

RSpec.feature "As a vistior" do
  describe "they can search for the 10 nearest electric and propane stations" do
    context "by zipcode" do
      VCR.use_cassette("nearest_by_zip") do
        key = ENV['NREL_KEY']

        
      end
    end
  end
end
