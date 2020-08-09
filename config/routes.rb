Rails.application.routes.draw do
  resources :items, only: [:show, :create]
  get ":id/inventory", to: "items#index", as: "inventory" 
  post "/generate", to: "items#generate", as: "generate"
  

  resources :listings, except: [:new,:edit] 
  get "/listing/new/:profile_id/:skin_id", to: "listings#new", as: "new_listing" 
  get "/listing/edit/:id/:profile_id/:skin_id", to: "listings#edit", as: "edit_listing"  
  
  resources :market, only: [:index, :show] 
  post "/market/:id", to: "market#transaction", as: "transaction"

  resources :profiles  

  devise_for :users  

  # payments 
  get "/addfunds", to: "payments#add_funds", as: "add_funds" 
  post "/addfunds10", to: "payments#add_funds_10", as: "ten" 
  post "/addfunds25", to: "payments#add_funds_25", as: "twenty" 
  post "/addfunds50", to: "payments#add_funds_50", as: "fifty"



  root "profiles#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
