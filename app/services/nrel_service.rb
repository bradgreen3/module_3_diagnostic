class NrelService

  def initialize(api_key)
    @api_key = api_key
  end

  def conn
    Faraday.new(:url => "https://developer.nrel.gov/") do |f|
      f.params[:api_key] = ENV['api_key']
      f.adapter            Faraday.default_adapter  # make requests with Net::HTTP
    end
  end

  def stations_by_zip(zip)
    response = conn.get "/api/alt-fuel-stations/v1/nearest.json?location=#{zip}"
    JSON.parse(response.body, symbolize_names: true)
  end
end
