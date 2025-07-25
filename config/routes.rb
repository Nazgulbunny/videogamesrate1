Rails.application.routes.draw do
  
  get '/search', to: 'search#index'
  get '/chat', to: 'chat#index'
  get '/top_videos', to: 'home#top_videos'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount ActionCable.server => "/cable"

  # Devise
  devise_for :users

  # Resources
  resources :events, except: [:edit, :update]
  resources :videos
  resources :posts
  resources :comments, only: [:create, :destroy]

  resources :games do
    resources :reviews, except: [:index]
  end

  resources :users do
    member do
      get :friends, :path => "teammates"
      get :followers
      get :deactivate
      get :mentionable
    end
  end

  resources :conversations, only: [:create] do
    member do
      post :close
    end
  end

  # Ratings
  post '/rate' => 'rater#create', :as => 'rate'


  authenticated :user do
    root to: 'home#index', as: 'home'
  end

  unauthenticated :user do
    root 'home#front'
  end

  match :follow, to: 'follows#create', as: :follow, via: :post
  match :unfollow, to: 'follows#destroy', as: :unfollow, via: :post
  match :like, to: 'likes#create', as: :like, via: :post
  match :unlike, to: 'likes#destroy', as: :unlike, via: :post
  match :find_friends, to: 'home#find_friends', as: :find_friends, via: :get, :path => "find_teammates"
  match :about, to: 'home#about', as: :about, via: :get
end
