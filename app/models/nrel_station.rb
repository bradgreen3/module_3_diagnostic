class NrelStation
  attr_reader :fuel_type_code, :distance, :street_address, :access_days_time, :station_name

  def initialize(raw_station)
    @fuel_type_code = raw_station[:fuel_type_code]
    @distance = raw_station[:distance]
    @street_address = raw_station[:street_address]
    @access_days_time = raw_station[:access_days_time]
    @station_name = raw_station[:station_name]
  end

  def self.all_stations(api_key, zip)
    stations = NrelService.new(api_key).stations_by_zip(zip).find_all {|s| s[:fuel_type_code] == "ELEC" || s[:fuel_type_code] == "LPG" }
    stations.map do |station|
      NrelStation.new(raw_station)
    end
  end

end
