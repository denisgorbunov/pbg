Rails.application.routes.draw do
#  resources :users
  root :to => 'home#index'
  resources :user_sessions
  match "login" => "user_sessions#new", :as => "login", via: [:get, :post]
  match "logout" => "user_sessions#destroy", :as => "logout", via: [:get, :post]

  get '404', :to => 'application#page_not_found'
end
