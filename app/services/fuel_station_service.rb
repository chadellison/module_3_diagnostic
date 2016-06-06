class FuelStationService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1/nearest.json?location=1617+Cole+Blvd+Golden+CO&fuel_type=ELEC&limit=1")
    @connection[:api_key] = ENV["api_key"]
  end

  def fuel_stations_hash(zipcode)
    parse(get_fuel_stations(zipcode))
  end

  private

    def get_fuel_stations(zipcode)
      "nearest.json?type=ECEC&limit=10&location=#{zipcode}"
      connection.params["limit"]
      connection.params["type"]
    end

    def parse(response)
      JSON.parse(response.body)
    end
end
