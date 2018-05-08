Rails.application.routes.draw do
  resources :static, only: [:new, :show]
  root 'static#index'
  resources :sectors
  resources :units
  resources :properties
  resources :admins
  resources :tenants

  get '/properties/:id/sectors', to: 'sector#show'
  get '/sectors/:id/units', to: 'unit#show'


  get "/tenant_login", to: 'tenants#tenant_login'
  get "/login", to: "sessions#new", as: "login"

  post "/sessions", to: "sessions#create", as: "sessions"
  # get "/dashboard", to: 'tenants#dashboard'
  get "/dashboard", to: 'admins#dashboard' #, as: "dashboard"
  <%= button_to 'Home', "/", method: :get %>
  <br><br>
  "Hello World"
  =======

  <%= form_tag("/admins_dashboard", method: "post") do %>
    Property: <%= collection_select :property, :property_id, @properties, :id, :name %>
    <%= submit_tag("Search"), property_path %>
  <% end %>

  <%= form_tag("/admins_dashboard", method: "post") do %>
    Sector:   <%= collection_select :sector, :sector_id, @sectors, :id, :name %>
    <%= submit_tag("Search") %>
  <% end %>

  <%= form_tag("/admins_dashboard", method: "post") do %>
    Unit:     <%= collection_select :unit, :unit_id, @units, :id, :name %>
    <%= submit_tag("Search") %>
  <% end %>


  # ICEBOXED
  # post "/logout", to: 'sessions#destroy'
  # get "/admin_login", to: 'admins#admin_login'

  # get "/login", to: 'static#login', as: 'login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
