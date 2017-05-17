class NrelService

  def initialize(key)
    @key = key
  end

  def nearest_stations
    response = Faraday.get("https://api.data.gov/nrel/alt-fuel-stations/v1/nearest.json?limit=10&api_key=#{ENV['NREL_KEY']}&location=80203&radius=6.0&fuel_type=ELEC,LPG")

    JSON.parse(response.body, symbolize_names: true)
  end

  def self.nearest_stations(key)
    nrel_service = NrelService.new(key)
    nrel_service.nearest_stations
  end

end
