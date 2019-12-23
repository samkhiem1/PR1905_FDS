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

  namespace :admins do
    resources :dashboards, only: :index
  end
end
