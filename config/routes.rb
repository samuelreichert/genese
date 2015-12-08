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

  get "/index", to: "home#index", as: "index_page"
  get "/resources", to: "home#resources", as: "resources_page"
  get "/about", to: "home#about", as: "about_page"
  # get "/contact", to: "home#contact", as: "contact_page"
  get "/help", to: "home#help", as: "help_page"

  get "/dashboard", to: "dashboard#index", as: "dashboard_page"

  resources :accounts, only: [:index, :show, :create, :update]
  resources :categories, only: [:new, :edit, :create, :update, :destroy]
  resources :contact_forms, only: [:index, :show, :new, :create]
  resources :entries

  # resources :articles do
  #   resources :comments, only: [:index, :new, :create]
  # end
  # resources :comments, only: [:show, :edit, :update, :destroy]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
end
