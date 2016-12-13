Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  
  devise_for :users

  get 'profile', to: 'users#profile'
  root to: 'users#profile'

  get 'users/:user_id/orders/new', to: 'orders#new'
  post 'users/:user_id/orders/', to: 'orders#create', as: :user_orders
  get '/users/:user_id/orders/', to: 'orders#index'
  get '/users/:user_id/piggy_orders/', to: 'orders#piggy_index'
  get '/users/:user_id/orders/:id', to: 'orders#show'
  delete '/users/:user_id/orders/:id', to: 'orders#destroy', as: :user_order
  patch  'users/:user_id/orders/:id', to: 'orders#update'

  get "/pages/:page" => "pages#show"

  #match 'orders/complete' => 'orders#complete' :via => post
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
	