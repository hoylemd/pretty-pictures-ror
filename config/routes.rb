Rails.application.routes.draw do
  get 'users/new'

  get 'home'  => 'pretty_pictures#home'

  get 'login' => 'users#login'
  get 'signup' => 'users#new'

  resources :users

  root 'pretty_pictures#home'
end
