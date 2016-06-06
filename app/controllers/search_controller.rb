class SearchController < ApplicationController
  def index
    @fuel_stations = FuelStation.nearest_fuel_stations(params["q"])
  end
end
