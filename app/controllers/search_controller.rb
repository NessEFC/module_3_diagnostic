class SearchController < ApplicationController

  def index
    response = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?limit=10&api_key=#{ENV['NREL_KEY']}&location=80203&radius=6.0&fuel_type=ELEC,LPG")

    raw_data = JSON.parse(response.body, symbolize_names: true)

    raw_stations = raw_data[:fuel_stations]

    @station_data = raw_stations.map do |station|
      station[:station_name]
    end
  end

end
