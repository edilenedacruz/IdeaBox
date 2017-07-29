Rails.application.routes.draw do
  root "home#index"

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  get '/logout', to: "sessions#destroy"

  resources :users

  namespace :admin do
    get "/dashboard", to: "users#show"
  end
end
