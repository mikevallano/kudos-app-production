Rails.application.routes.draw do
  resources :kudos

  resources :kudotypes

  root to: 'visitors#index'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users
end
