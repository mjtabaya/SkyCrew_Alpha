Rails.application.routes.draw do
  resources :arsenals
  resources :weapons
  resources :skyfarers
  resources :captains
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  # root 'application#skycrew_test'

end
