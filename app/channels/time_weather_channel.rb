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
    error_messages = ''
    cities = []
    begin
      raise StandardError, 'How unfortunate! The API Request Failed' if rand < 0.1

      all_cities = fetch_cities_redis
      santiago = all_cities.select { |city| city['short_name'] == 'CL' }[0]
      cities = all_cities - [santiago]
    rescue StandardError => e
      update_redis_api_errors(e.message)
      error_messages = e.message
    end
    ActionCable.server.broadcast 'actual_channel',
                                 santiago: santiago,
                                 cities: cities,
                                 errors: error_messages
  end
end
