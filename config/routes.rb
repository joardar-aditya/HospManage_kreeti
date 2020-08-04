Rails.application.routes.draw do
  root to: 'session#new'
  resources :patients
  resources :staffs
  resources :forget_password
  get '/login', to: 'session#new'
  get '/session', to: 'session#new'
  delete '/logout', to: 'session#destroy'
  post '/session', to: 'session#create'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
