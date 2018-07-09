Rails.application.routes.draw do
  get 'static_pages/home'

  get 'static_pages/help'

  resources :arsenals
  resources :weapons
  resources :skyfarers
  resources :captains
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
  # root 'application#skycrew_test'

end
