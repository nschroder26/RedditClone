Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'static_pages#home'
  get '/users', to: 'users#index'
  patch 'users/create_admin', to: 'users#create_admin', as: 'create_admin'
  patch 'users/remove_admin', to: 'users#remove_admin', as: 'remove_admin'
  resources :categories
end
