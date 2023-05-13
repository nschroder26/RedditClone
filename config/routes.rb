Rails.application.routes.draw do
  devise_for :users

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'static_pages#home'
  get '/users', to: 'users#index'
  patch 'users/make_admin', to: 'users#make_admin', as: 'make_admin'
  patch 'users/remove_admin', to: 'users#remove_admin', as: 'remove_admin'
end
