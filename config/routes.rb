Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users,
    path: "",
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      password: 'password',
      confirmation: 'verification',
      unlock: 'unlock',
      registration: 'register',
      sign_up: 'signup'
    }, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

  root to: "home#index"

  get "/about", to: "home#about", as: "about_page"
  get "/dashboard", to: "dashboard#index", as: "dashboard_page"
  post "/main_account", to: "accounts#main_account", as: "main_account"
  post "/entry_paid", to: "entries#entry_paid", as: "entry_paid"
  get "/index", to: "home#index", as: "index_page"
  get "/resources", to: "home#resources", as: "resources_page"

  resources :accounts, only: [:index, :new, :create, :update, :destroy]
  resources :categories, only: [:new, :edit, :create, :update, :destroy]
  resources :contact_forms, only: [:index, :show, :create]
  resources :entries
  resources :reports, only: [:index]
  resources :settings, only: [:index]
  resources :tutorials, only: [:index, :show]

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
