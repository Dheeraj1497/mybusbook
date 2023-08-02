Rails.application.routes.draw do
  root "sessions#new"

  resources :users do
    resources :bookings
  end
  resources :dashboard
  resources :bookings
    resources :bus_routes do
       resources :buses
    end
  
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create', as: "user_login"
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'

end
