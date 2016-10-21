Rails.application.routes.draw do
  resources :zombiedata
  resources :zombies
  get '/search'=> 'zombiedata#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount Api, at: 'api/'
end
