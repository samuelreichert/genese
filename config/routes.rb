Rails.application.routes.draw do
  # devise_for :users
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
  get "/contact", to: "home#contact", as: "contact_page"
  get "/help", to: "home#help", as: "help_page"

  get "/dashboard", to: "dashboard#index", as: "dashboard_page"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
