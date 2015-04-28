json.array!(@items) do |item|
  json.extract! item, :id, :name, :price, :submenuId, :restaurantId
  json.url item_url(item, format: :json)
end
