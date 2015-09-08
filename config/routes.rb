Rails.application.routes.draw do

  root 'v1/home#index'

  get 'home', to: 'v1/home#index'

  #User
  get 'user' , to: 'v1/user#index'
  get 'user/add', to: 'v1/user#add'
  post 'user/insert', to: 'v1/user#insert'
  get 'user/edit/:id', to: 'v1/user#edit'
  post 'user/update', to: 'v1/user#update'

  #Channel
  get 'channel' , to: 'v1/channel#index'
  get 'channel/add', to: 'v1/channel#add'
  post 'channel/insert', to: 'v1/channel#insert'
  get 'channel/edit/:id', to: 'v1/channel#edit'
  post 'channel/update', to: 'v1/channel#update'

  #ChannelType
  get 'channel_type' , to: 'v1/channel_type#index'
  get 'channel_type/add', to: 'v1/channel_type#add'
  post 'channel_type/insert', to: 'v1/channel_type#insert'
  get 'channel_type/edit/:id', to: 'v1/channel_type#edit'
  post 'channel_type/update', to: 'v1/channel_type#update'

  get 'login', to: 'v1/login#index'
  get 'logout', to: 'v1/login#logout'
  post 'attempt_login', to: 'v1/login#attempt_login'

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
