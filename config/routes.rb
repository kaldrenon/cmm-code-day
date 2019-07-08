Rails.application.routes.draw do
  resources :customers
  resources :projects
  resources :task_steps
  resources :tasks do
    collection do
      get :all
    end

    member do
      get 'start'
      get 'stop'
    end
  end

  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get  'users/register'
  post 'users/create'

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "users#login"
end
