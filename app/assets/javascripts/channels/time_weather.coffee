App.time_weather = App.cable.subscriptions.create "TimeWeatherChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log(data)
    $('#time_stgo').html(data['santiago'].current_time)
    $('#date_stgo').html(data['santiago'].current_date)
    $('#weather_stgo').html(data['santiago'].current_weather + 'ºC')
    $.each data['cities'], (key, value) ->
      console.log(value)
      city_id = value.id
      time = value.current_time
      date = value.current_date
      $('#city_time_' + city_id).html(time)
      $('#city_date_' + city_id).html(date)
      return

  syncronize: ->
    @perform 'syncronize'

$(document).on 'keypress', (event) ->
  if event.keyCode is 13
    App.time_weather.syncronize()
  # window.setInterval (->
  #   return
  # ), 10000