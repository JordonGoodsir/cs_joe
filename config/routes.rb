Rails.application.routes.draw do
  resources :items 

  resources :listings 

  resources :profiles 

  devise_for :users 

  root "profiles#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
