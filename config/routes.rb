Rails.application.routes.draw do
  resources :static, only: [:new, :show]
  root 'static#index'
  resources :sectors
  resources :units
  resources :properties
  resources :admins
  resources :tenants

  get "/login", to: 'static#login'
  get "/admin_login", to: 'admins#admin_login'
  get '/properties/:id/sectors', to: 'sector#show'
  get '/sectors/:id/units', to: 'unit#show'


  get "/tenant_login", to: 'tenants#tenant_login'

  get "tenant_homepage", to: 'tenant#home'
  # post "/sessions", to: 'sessions#create'
  # post "/logout", to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
