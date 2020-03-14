Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  root 'pages#home'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }
  devise_for :users, path: '/', controllers: {
    passwords: 'users/passwords',
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :documents, only: [:index, :new, :create, :destroy, :show] do
    resources :comments, only: [:create, :destroy]
    resources :downloads, only: :create
  end
  namespace :admins do
    resources :dashboards, only: :index
    resources :categories
    resources :documents, only: [:index, :update, :destroy]
  end
  resources :friendships, only: [:create, :destroy, :index, :show, :update]
  resources :users, only: :show
  resources :categories, only: [:index,:show]
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
  # mount ActionCable.server => '/cable'
end
