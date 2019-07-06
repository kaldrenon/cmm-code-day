Rails.application.routes.draw do
  get 'users/list'
  get 'users/login'
  get 'users/register'
  post 'users/create'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users#login"
end
