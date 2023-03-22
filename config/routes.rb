Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  resources :users
  resources :foods, except: :update
  resources :recipes do
    resources :recipe_foods, only: [:new, :create, :destroy]
  end
  get '/general_shopping_lists', to: 'recipe_foods#general_shopping_lists'
  resources :public_recipes
end
