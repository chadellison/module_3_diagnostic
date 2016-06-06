class FuelStationService
  attr_reader :connection

  def initialize
    @connection = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1.json")
    @connection.params[:api_key] = ENV["api_key"]
  end

  private

    def get_fuel_stations(count)

    end
end
