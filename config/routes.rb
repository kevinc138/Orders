Rails.application.routes.draw do
  
  resources :locations

  resources :items

  resources :submenus

  get 'devise/home', :to => 'home#view_cart'

  get 'store/view_cart'
  get 'home/index'

  resources :restaurants

  get 'home/view_rest_orders'
  get 'home/deactivate_order'
  get 'home/activate_order'
  get 'restaurant/view_orders'
  root 'home#index'
  get 'home/place_order'
  get 'home/view_orders'
  get 'home/decrease_quantity'
  get 'home/increase_quantity'
  get 'home/remove_item'

  
  devise_for :users, :controllers => { registrations: 'registrations' }
  post 'home/add_to_cart'
  get 'home/empty_cart'
  post 'home/index'
  get 'home/view_cart'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
