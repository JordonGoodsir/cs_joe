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
  post "/addfunds_payments", to: "payments#add_funds_payments", as: "payment"  
  get  "/addfunds_payments_ten", to: "payments#add_funds_ten", as:"ten" 
  get  "/addfunds_payments_twenty", to: "payments#add_funds_twenty", as:"twenty" 
  get  "/addfunds_payments_fifty", to: "payments#add_funds_fifty", as:"fifty"
  post '/payments/webhook', to: "payments#webhook" 
  get '/payments/success/:amount', to: "payments#success", as:"success"



  root "profiles#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
