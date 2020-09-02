Rails.application.routes.draw do
  resources :appointments
  ActiveAdmin.routes(self)
  root to: 'session#new'
  resources :patients do 
    post :change_status
    resources :appointments 
  end
  resources :staffs
  resources :forget_password
  resources :admin_session
  get "/sort", controller: 'patients', action: 'sort_patients'
  post '/patients/check_validation_email',  controller: 'patients', action: 'check_validation_email'
  get '/login', to: 'session#new'
  get '/session', to: 'session#new'
  get '/admin_logout', to: 'admin_session#destroy', as: 'admin_session_logout'
  put '/forgetp_request', to: 'forget_password#forgetp', as: 'forget_password_request'
  get '/logout', to: 'session#destroy'
  post '/session', to: 'session#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
