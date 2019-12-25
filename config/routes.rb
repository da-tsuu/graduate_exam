Rails.application.routes.draw do
  resources :comments
  get 'home/index'
  get 'home/show'
  root to: "posts#index"
  resources :posts do
    resources :comments
  end
  resources :favorites, only: [:create, :destroy]
  devise_for :users
  resources :users, only: [:show]

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
end
