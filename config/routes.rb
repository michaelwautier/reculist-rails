Rails.application.routes.draw do
  get 'categories/index'
  devise_for :users

  root to: 'pages#home'

  resources :tasks do
    resources :subtasks
  end
end
