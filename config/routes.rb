Rails.application.routes.draw do
  resources :dishes, only: [:show] do
    resources :ingredients, only: [:create], controller: 'dishes_ingredients'
  end

  resources :chefs, only: [:show] do
    resources :ingredients, only: [:index], controller: 'chefs_ingredients'
  end
end
