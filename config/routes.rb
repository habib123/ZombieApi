Rails.application.routes.draw do

  devise_for :users, path_prefix: 'my', controllers: { :sessions => "users/sessions",registrations: "users/registrations" }
  resources :users
  root to: 'pages#index'
  resources :zombiedata
  resources :zombies
  get '/search'=> 'zombiedata#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Api, at: 'api/'
end
