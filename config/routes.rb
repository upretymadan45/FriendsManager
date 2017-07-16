Rails.application.routes.draw do
  resources :friends
  get 'home/index'

  devise_for :users
  root to: "home#index"
end
