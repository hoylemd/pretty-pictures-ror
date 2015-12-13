Rails.application.routes.draw do
  root      'pretty_pictures#home'
  get       'home'    => 'pretty_pictures#home'
  get       'signup'  => 'users#new'
  resources :users

  get       'login'   => 'sessions#new'
  post      'login'   => 'sessions#create'
  delete    'logout'  => 'sessions#destroy'

  get       'connect' => 'users#connect'
  post      'connect' => 'users#create_connection'
  delete    'connect' => 'users#destroy_connection'
end
