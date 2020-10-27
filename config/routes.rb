Rails.application.routes.draw do
  resources :sessions
  resources :attendances
  resources :events
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "events#index"
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  post 'signup', to: 'users#create'
  post '/attend', to: 'attendances#create'
  get '/attend', to: 'attendances#create'
end
