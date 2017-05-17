class Station

  def initialize(attrs={})
    @attrs = attrs
  end

  def self.nearest_stations(key)
    raw_data = NrelService.nearest_stations(key)
    raw_stations = raw_data[:fuel_stations]

    raw_stations.map { |station| Station.new(station) }
  end

end
