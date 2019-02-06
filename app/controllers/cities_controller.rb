# Cities
class CitiesController < ApplicationController
  include CitiesHelper
  def index
    @cities = fetch_cities_redis #Here we're calling redis server instead of actual Database call
  end
end
