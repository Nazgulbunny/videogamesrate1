Rails.application.routes.draw do

  post '/rate' => 'rater#create', :as => 'rate'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :posts
  resources :comments, only: [:create, :destroy]
  devise_for :users
  resources :users do
    member do
      get :friends, :path => "teammates"
      get :followers
      get :deactivate
      get :mentionable
    end
  end
  resources :events, except: [:edit, :update]

	resources :videos

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
