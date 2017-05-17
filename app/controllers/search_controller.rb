class SearchController < ApplicationController

  def index
    
    response = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?limit=10&api_key=#{ENV['NREL_KEY']}&location=80203&radius=6.0&fuel_type=ELEC,LPG")
binding.pry
    raw_stations = JSON.parse(response.body, symbolize_names: true)

  end


end
