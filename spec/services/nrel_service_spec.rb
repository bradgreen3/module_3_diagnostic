require 'rails_helper'

describe "NrelService" do
  context "#alternative fuel stations" do
    it "returns all alternative fuel stations for a given zip code" do
      zip = '80203'

      VCR.use_cassette("#altstations") do
        stations_by_zip = NrelService.new(ENV["api_key"]).stations_by_zip(zip)
        station = stations_by_zip.first

        expect(stations_by_zip).to be_an(Array)
        expect(station).to have_key(:fuel_type_code)
        expect(station).to have_key(:distance)
        expect(station).to have_key(:street_address)
        expect(station).to have_key(:access_days_time)
        expect(station).to have_key(:station_name)
      end
    end
  end
end
