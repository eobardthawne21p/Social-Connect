Rails.application.routes.draw do
  #resources :users, except: [ :new ] # This removes the new action

  # Limit the users resource to only the necessary routes for profile functionality
  #resources :users, only: [:show, :edit, :update]
  resources :users, except: [:new]

  # Sign up routes
  get "sign_up", to: "users#new", as: "sign_up"
  post "sign_up", to: "users#create"

# Login routes
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
 
  # Custom route for the logged-in user's profile
  get 'profile', to: 'users#show', as: :profile

  # Settings route
  get 'settings', to: 'users#settings', as: :settings

  #root 'users#show' # this would require passing a specific user (like the logged-in user) in the controller
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
End
