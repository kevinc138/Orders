json.array!(@submenus) do |submenu|
  json.extract! submenu, :id, :name, :restaurant, :restaurantId
  json.url submenu_url(submenu, format: :json)
end
