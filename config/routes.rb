Rails.application.routes.draw do
  resources :tags
  resources :coupons
  resources :answers
  resources :questions
  resources :orders
  resources :reviews
  resources :comments
  resources :categories
  resources :products
  resources :users
  resource :sessions, only: [:new, :create, :destroy]

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
