#
class City < ApplicationRecord
  # coords_array is an array of cities with lat and lon
  def self.time_weather_by_coords(lat, lon)
    data = ForecastIO.forecast(lat, lon)
    if data.present?
      temperature_f = Temperature.from_fahrenheit(data.currently.temperature)
      temperature = temperature_f.celsius.round(0)
      datetime = data.currently.time
      timezone = data.timezone
      date = Time.at(datetime).in_time_zone(timezone).strftime('%a %d %b')
      time = Time.at(datetime).in_time_zone(timezone).strftime('%H:%M')
    else
      date = '-'
      time = '--:--'
      temperature = '-'
    end
    [date, time, temperature]
  end
end
