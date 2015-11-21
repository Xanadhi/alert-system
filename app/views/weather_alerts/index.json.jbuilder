json.array!(@weather_alerts) do |weather_alert|
  json.extract! weather_alert, :id
  json.url weather_alert_url(weather_alert, format: :json)
end
