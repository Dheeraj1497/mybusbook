Rails.application.routes.draw do
  
  root "sessions#new"
  
  resources :users do
    resources :bookings
  end
  
  resources :cities do
    resources :locations
  end
  
  resources :dashboard
  resources :helps

  resources :bookings
    resources :bus_routes do
       resources :buses
    end
  
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create', as: "user_login"
  # post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  get '/confirm', to: 'bookings#confirm'
  get '/cancel', to: 'bookings#cancel'

end
