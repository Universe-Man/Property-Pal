Rails.application.routes.draw do
  resources :static, only: [:new, :show]
  root 'static#index'
  resources :sectors
  resources :units
  resources :properties
  resources :admins
  resources :tenants
  get '/success', to: "tenants#success", as: "success"
  get '/properties/:id/sectors', to: 'sector#show'
  get '/sectors/:id/units', to: 'unit#show'


  # get "/tenant_login", to: 'tenants#tenant_login'
  get "/login", to: "sessions#new", as: "login"

  post "/sessions", to: "sessions#create", as: "sessions"
  # get "/dashboard", to: 'tenants#dashboard'
  get "/admin-dashboard", to: 'admins#dashboard' #, as: "dashboard"
  get "/tenant-dashboard", to: 'tenants#dashboard'
  # get '/tenants/:id/dashboard', to: 'tenants#dashboard', as: 'tenants_dashboard'


  # ICEBOXED
  post "/logout", to: 'sessions#destroy'
  # get "/admin_login", to: 'admins#admin_login'

  # get "/login", to: 'static#login', as: 'login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
