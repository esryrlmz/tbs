json.array!(@event_locations) do |event_location|
  json.extract! event_location, :id
  json.url event_location_url(event_location, format: :json)
end
