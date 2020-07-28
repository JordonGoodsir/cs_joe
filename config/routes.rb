Rails.application.routes.draw do
  resources :items, only: [:show, :destroy, :create]
  get ":id/inventory", to: "items#index", as: "inventory"
  

  resources :listings 

  resources :profiles 

  devise_for :users 

  root "profiles#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
