require "rails_helper"

VCR.use_cassette("fuel_stations") do
  describe "Fuel stations service" do
    scenario "it shows info about the fuel station" do
      service = FuelStationService.new
      stations = service.stations_hash

      expect(stations.count).to eq 20
      expect(stations.first.name).to eq "some name"
      expect(stations.last.address).to eq "this address"
    end
  end
end
