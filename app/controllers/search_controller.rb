class SearchController < ApplicationController
  def index
    @stations = NrelStation.all_stations(ENV['api_key'], params[:q])
  end
end
