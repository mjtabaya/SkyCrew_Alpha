Rails.application.routes.draw do

    #=> domain.com/weapons/:weapons_id/:captain_id/:id
#   resources :weapons do
#      post "captains/:captain_id/weapons/:weapon_id/" => add_arsenal
#   end

  post '/add_arsenal', to: 'weapons#add_arsenal'

  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/catalog', to: 'weapons#catalog'

  get '/home', to: 'static_pages#home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  resources :arsenals
  resources :weapons
  resources :skyfarers
  resources :captains
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  # root 'application#skycrew_test'

end
