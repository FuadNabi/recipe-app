Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  resources :users
  resources :foods, except: :update
  resources :recipes, except: :update
  resources :general_shoping_lists, only: [:index]
  resources :public_recipes, only: [:index]
end
