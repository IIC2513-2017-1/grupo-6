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

  get '/sessions/request_password', to: 'sessions#request_password'
  post '/sessions/request_password', to: 'sessions#send_new_password_key'

  get '/sessions/reset_password', to: 'sessions#new_password'
  post '/sessions/reset_password', to: 'sessions#reset_password'

  get '/dashboard', to: 'home#dashboard'

  get '/users/:id/token', to: 'users#show_token', as: :show_token
  post '/users/:id/token', to: 'users#generate_token', as: :generate_token

  root 'home#index'

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show]
      resources :reviews, only: [:index, :show, :create, :destroy]
      resources :questions, only: [:index, :show, :create, :destroy]
      resources :answers, only: [:index, :show, :create, :destroy]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
