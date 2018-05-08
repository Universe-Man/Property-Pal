Rails.application.routes.draw do
  resources :static, only: [:new, :show]
  root 'static#index'
  resources :sectors
  resources :units
  resources :properties
  resources :admins
  resources :tenants
  # get "/login", to: 'static#login'
  get "/admin_login", to: 'admins#admin_login'
  # get "/tenant_login", to: 'tenants#tenant_login'
  post "/verify_login", to: 'application#verify'
  get "tenant_homepage", to: 'tenant#home'
  get "admins/dashboard", to: 'admins#dashboard', as: 'admin_dashboard'

  # get "/signup", to: "users#new", as: "signup"
  get "/login", to: "sessions#new" , as: "login"

  post "/sessions", to: "sessions#create", as: "sessions"
  post "/logout", to: "sessions#destroy", as: "logout"

  post "/sessions", to: 'sessions#create'
  # post "/logout", to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
