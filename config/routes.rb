Rails.application.routes.draw do
  get 'categories/index'
  devise_for :users

  root to: 'pages#home'

  resources :task_templates do
    post 'create_task', to: 'task_templates#create_task_from_template', as: 'create_task'
  end

  resources :tasks do
    resources :subtasks do
      patch :toggle_completed
    end
  end
end
