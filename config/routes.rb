Rails.application.routes.draw do
  # Order Management
  resources :order_items
  resources :orders
  resources :products

  # Cart Management
  get  '/cart',             to: 'cart#show',         as: 'cart'
  post '/cart/add/:id',     to: 'cart#add',          as: 'add_to_cart'
  post '/cart/remove/:id',  to: 'cart#remove',       as: 'remove_from_cart'
  post '/cart/update/:id',  to: 'cart#update',       as: 'update_cart'

  # Checkout Process
  get  '/checkout',          to: 'cart#checkout',     as: 'checkout'
  post '/cart/submit_order', to: 'cart#submit_order', as: 'submit_order'

  # Storefront
  get '/store',             to: 'store#index',       as: 'store_index'
  get '/store/:id',         to: 'store#show',        as: 'store_show'

  # Devise Authentication for Admin
  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :admins
  ActiveAdmin.routes(self)

  # Home Page
  root "products#index"

  # Product & Category Resources
  resources :products, only: [:index, :show]
  resources :categories
end
