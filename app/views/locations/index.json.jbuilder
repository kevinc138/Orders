json.array!(@locations) do |location|
  json.extract! location, :id, :address, :latitude, :longitude, :restaurant_id, :user_id
  json.url location_url(location, format: :json)
end
