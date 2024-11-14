Rails.application.routes.draw do
  get 'dashboard/moderator'
  resources :saved_posts
  resources :likes
  resources :chat_boards
  resources :posts do
    member do
      post "like"
      post "unlike"
      post :save
      post :unsave
      post "going"
      post "not_going"
      post "approve"
      post "reject"
    end
  end

  resources :users, except: [ :new ] # This removes the new action

  root "pages#home"

  get "sign_up", to: "users#new", as: "sign_up"
  post "sign_up", to: "users#create"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  delete "logout", to: "sessions#destroy"

  get "moderator_dashboard", to: "dashboard#moderator"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
end
