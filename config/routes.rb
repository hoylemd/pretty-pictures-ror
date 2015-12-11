Rails.application.routes.draw do
  root      'pretty_pictures#home'
  get       'home'    => 'pretty_pictures#home'
  get       'signup'  => 'users#new'
  resources :users

  get       'login'   => 'sessions#new'
  post      'login'   => 'sessions#create'
  delete    'logout'  => 'sessions#destroy'

end
