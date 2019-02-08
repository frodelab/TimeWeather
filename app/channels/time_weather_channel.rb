# Channel provides client with updated info about weather and time
class TimeWeatherChannel < ApplicationCable::Channel
  include CitiesHelper

  def subscribed
    stream_from 'actual_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def syncronize
    all_cities = fetch_cities_redis
    santiago = all_cities.select { |city| city['short_name'] == 'CL' }
    cities = all_cities - santiago
    ActionCable.server.broadcast 'actual_channel',
                                 santiago: santiago[0],
                                 cities: cities,
                                 message: 'hola'
  end
end
