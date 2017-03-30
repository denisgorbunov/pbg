Rails.application.routes.draw do
#  resources :users
  root :to => 'home#index'
  resources :user_sessions
  resources :clients, except: :show
  resources :requests
  match "login" => "user_sessions#new", :as => "login", via: [:get, :post]
  match "logout" => "user_sessions#destroy", :as => "logout", via: [:get, :post]
  get 'requests/:id/zip' => "requests#zip", :as => 'zip_create'

#  get '404', :to => 'application#page_not_found'
end
