# Here goes functions to simplify info sent to views
module CitiesHelper
  def fetch_cities_redis
    cities = $redis.get('citiess') #This line requests redis-server to accepts any value associate with articles key
    if cities.nil? #this condition will executes if any articles not available on redis server
      cities = update_redis_time_weather(City.all.to_json)
    else
      cities = update_redis_time_weather(cities)
    end
    JSON.parse cities #This will converts JSON data to Ruby Hash
  end

  private

  def update_redis_time_weather(cities)
    json_cities = JSON.parse cities
    json_cities.each do |city|
      # city = json_cities[0]
      date, time, weather = City.time_weather_by_coords(city['latitude'], city['longitude'])
      city['current_date'] = date
      city['current_time'] = time
      city['current_weather'] = weather
    end
    $redis.set('citiess', json_cities.to_json)
    $redis.expire('citiess', 1.hour.to_i)
    json_cities.to_json
  end
end
