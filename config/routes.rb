Rails.application.routes.draw do
  get 'home/index'
  get 'home/show'
  root to: "posts#index"
  resources :posts 
  resources :favorites, only: [:create, :destroy]
  devise_for :users
  resources :users, only: [:show]

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy" 
  end
end
