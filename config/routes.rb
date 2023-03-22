Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  resources :users
  resources :foods, except: :update
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  resources :general_shoping_lists, only: [:index]
  resources :public_recipes
end
