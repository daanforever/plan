Rails.application.routes.draw do

  # resource :tasks
  get '/tasks/archive', to: 'tasks#archive'
  patch '/tasks', to: 'tasks#reorder', as: 'reorder_tasks'
  patch '/tasks/:id/restore', to: 'tasks#restore', as: 'restore_task'
  resources :tasks, except: [ :new ]

  devise_for :users

  get 'welcome/index'
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
