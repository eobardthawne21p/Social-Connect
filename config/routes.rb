Rails.application.routes.draw do
  get "profiles/show"
  get "dashboard/moderator"
  resources :saved_posts
  resources :likes
  resources :chat_boards

  resources :posts do
    resources :chat_boards, only: [ :create, :edit, :update, :destroy ] # Nested routes for chatboard comments
    member do
      post "like"
      post "unlike"
      post :save
      post :unsave
      post "going"
      post "not_going"
      post "approve"
      post "reject"
      get "edit_profile", to: "users#edit_profile"
      patch "update_profile", to: "users#update_profile"
      get :saved_posts
    end
  end

  # Admin namespace
  namespace :admin do
    get "manage_moderators", to: "users#manage_moderators", as: "manage_moderators"
    post "add_moderator/:user_id", to: "users#add_moderator", as: "add_moderator"
    delete "remove_moderator/:id", to: "users#remove_moderator", as: "remove_moderator"
  end

  resources :users, except: [ :new ]

  resources :profiles, only: [ :show, :edit, :update ] do
    member do
      get :show_original_posts, to: "profiles#show_original_posts"
      get :show_saved_posts, to: "profiles#show_saved_posts"
    end
  end

  root "pages#home"

  get "results", to: "posts#results"

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
