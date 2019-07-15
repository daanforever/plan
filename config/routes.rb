Rails.application.routes.draw do
  resource :tasks
  root to: 'welcome#index'
  devise_for :users
  get 'welcome/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
