Rails.application.routes.draw do
  devise_for :users
  root to: 'tasks#index'
  resources :users, only: [:edit, :update]
  resources :tasks, except: [:index] do
    resources :priority, only: [:show, :edit]
  end
end