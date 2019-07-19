Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'pages#home'
  # get '/home', to: 'pages#home'
  root 'pages#home'
  get '/about', to: 'pages#about'

  resources :articles

  # Section 119 New User Signup
  get 'signup', to: 'users#new'   #send to UsersController new action
  # post 'users', to: 'users#create'
  resources :users, except: [:new]  #replace the above statement post 'users' ...
end
