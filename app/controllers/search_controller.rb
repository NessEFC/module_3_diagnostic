class SearchController < ApplicationController

  def index
    @stations = Station.nearest_stations(params[:search])
  end

end
