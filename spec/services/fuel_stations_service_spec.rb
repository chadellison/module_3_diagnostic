require "rails_helper"

VCR.use_cassette("fuel_stations") do
  describe "Fuel stations service" do
    scenario "it shows info about the fuel station" do
      service = FuelStationService.new
      stations = service.fuel_stations_hash("80130")

      expect(stations.count).to eq 8
      expect(stations.first.name).to eq "some name"
      expect(stations.last.address).to eq "this address"
    end
  end
end
