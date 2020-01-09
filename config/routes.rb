Rails.application.routes.draw do
  root 'pages#home'
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }
  devise_for :users, path: '/', controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :documents, only: [:index, :new, :create, :destroy, :show] do
    resources :comments, only: [:create, :destroy]
  end
  namespace :admins do
    resources :dashboards, only: :index
    resources :categories
    resources :documents, only: [:index, :update, :destroy]
  end
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'
end
