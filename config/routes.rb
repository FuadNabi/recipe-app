Rails.application.routes.draw do
  get 'home/index'
  root 'home#index'
  
  resources :users
  resources :foods, except: :update
  resources :recipes, except: :update

  get '/public_recipes', to: 'recipes#public_recipes'
  get '/general_shopping_lists', to: 'recipe_foods#general_shopping_lists'
end
