require 'rails_helper'

describe "NrelService" do
  context "#alternative fuel stations" do
    it "returns all alternative fuel stations for a given zip code" do
      zip = '80203'

      VCR.use_cassette("#altstations") do
        stations_by_zip = NrelService.new(ENV["api_key"]).stations_by_zip(zip)
        station = stations_by_zip.first

        require "pry"; binding.pry
        expect(stations_by_zip).to be_an(Array)
        expect(station).to have_key(:fuel_type_code)
      end
    end
  end
end
