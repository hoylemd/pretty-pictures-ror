Rails.application.routes.draw do
  get 'home'  => 'pretty_pictures#home'
  get 'login' => 'pretty_pictures#login'

  root 'application#hello'
end
