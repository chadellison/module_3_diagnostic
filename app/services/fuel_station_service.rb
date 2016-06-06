class FuelStationService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1")
    @connection.params[:api_key] = ENV["api_key"]
  end

  def fuel_stations_hash(zipcode)
    parse(get_fuel_stations(zipcode))
  end

  private

    def get_fuel_stations(zipcode)
      connection.get "nearest.json?type=ECEC+LPG&limit=10&location=#{zipcode}"
    end

    def parse(response)
      JSON.parse(response.body, symbolize_names: true)
    end
end
