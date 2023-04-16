Rails.application.routes.draw do
  resources :dishes, only: [:show] do
    resources :ingredients, only: [:create]
  end

  resources :chefs, only: [:show] do
    resources :ingredients, only: [:index]
  end
end
