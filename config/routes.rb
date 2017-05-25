Rails.application.routes.draw do
  resources :tags
  resources :coupons
  resources :answers
  resources :questions
  resources :orders
  resources :reviews
  resources :comments
  resources :categories
  resources :products do 
    resources :images, only: [:create, :destroy]
  end
  resources :users
  resource :sessions, only: [:new, :create, :destroy]

  post '/cart/add', to: 'shopping_cart#add_item'
  post '/cart/remove', to: 'shopping_cart#remove_item'
  post '/cart/edit', to: 'shopping_cart#adjust_quantity'
  get '/cart', to: 'shopping_cart#show'

  post '/cart/submit', to: 'orders#create_from_cart'

  get '/users/:id/orders', to: 'orders#user_orders'

  get '/sessions/restore_password', to: 'sessions#restore_password'
  post '/sessions/restore_password', to: 'sessions#send_new_password'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
