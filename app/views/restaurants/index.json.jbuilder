json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :name, :address, :visible, :description, :logo
  json.url restaurant_url(restaurant, format: :json)
end
