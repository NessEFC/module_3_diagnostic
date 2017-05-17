class SearchController < ApplicationController

  def index
    binding.pry
    @stations = Station.nearest_stations(params[:search])
  end
  
end
