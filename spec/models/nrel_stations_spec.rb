require 'rails_helper'

describe "NrelFuelStations" do
  context ".all_stations" do
    it "returns all stations by zip" do
      VCR.use_cassette("NrelStation.all_stations") do
        stations = NrelStation.all_stations(ENV['api_key'])
        station = stations.first

        expect(stations).to be_an(Array)
        expect(station).to be_a(NrelStation)
        expect(station).to respond_to(:fuel_type_code)
        expect(station).to respond_to(:distance)
        expect(station).to respond_to(:street_address)
        expect(station).to respond_to(:access_days_time)
        expect(station).to respond_to(:station_name)
      end
    end
  end
end
