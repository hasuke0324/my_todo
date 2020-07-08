Rails.application.routes.draw do
  root to: 'tasks#index'
  resources :tasks, except: [:index] do
    resources :priority, only: [:show, :edit]
  end
end