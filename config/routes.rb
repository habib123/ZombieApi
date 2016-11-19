Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: 'pages#index'
  resources :zombiedata
  resources :zombies
  resources :users
  get '/search'=> 'zombiedata#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Api, at: 'api/'
end
