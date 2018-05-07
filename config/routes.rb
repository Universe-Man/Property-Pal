Rails.application.routes.draw do
  resources :static, only: [:new, :show]
  root 'static#index'
  resources :sectors
  resources :units
  resources :properties
  resources :admins
  resources :tenants
  post "/sessions", to: 'sessions#create'
  post "/sessions", to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
