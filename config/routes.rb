Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :accounts, only: [:show]
  resources :tickets, only: [:index, :new, :create, :show]


  
  # Defines the root path route ("/")
  root "accounts#show"
end
