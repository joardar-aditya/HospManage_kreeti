Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  root to: 'session#new'
  resources :patients
  resources :staffs
  resources :forget_password
  resources :admin_session
  get '/login', to: 'session#new'
  get '/admin_logout', to: 'admin_session#destroy', as: 'admin_session_logout'
  get '/session', to: 'session#new'
  delete '/logout', to: 'session#destroy'
  post '/session', to: 'session#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
