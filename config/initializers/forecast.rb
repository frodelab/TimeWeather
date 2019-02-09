require 'forecast_io'

ForecastIO.configure do |c|
  c.api_key = ENV['FORECAST_IO_KEY']
end
