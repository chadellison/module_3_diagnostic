class FuelStation < OpenStruct
  def service
    @service = FuelStationService.new
  end

  def self.nearest_fuel_stations(params)
    @service.fuel_stations_hash(params).map do |fuel_station|
      FuelStation.new(fuel_station)
    end
  end
end
