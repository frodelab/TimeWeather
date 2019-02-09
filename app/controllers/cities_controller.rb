# Cities
class CitiesController < ApplicationController
  include CitiesHelper

  def index
    all_cities = fetch_cities_redis #Here we're calling redis server instead of actual Database call
    @santiago = all_cities.select { |city| city['short_name'] == 'CL' }.first
    @cities = all_cities - [@santiago]
  end
end
