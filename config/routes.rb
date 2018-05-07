Rails.application.routes.draw do
  resources :users
  get '/signup' => 'users#new', as: :signup
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new', as: :login
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout

  root 'home#index'
end
