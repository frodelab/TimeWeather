module CitiesHelper
  def fetch_cities_redis
    cities = $redis.get("cities")  #This line requests redis-server to accepts any value associate with articles key
    if cities.nil? #this condition will executes if any articles not available on redis server
      cities = City.all.to_json
      $redis.set('articles', cities)
      $redis.expire('articles', 5.hour.to_i)
    end
    JSON.parse cities #This will converts JSON data to Ruby Hash
  end
end
