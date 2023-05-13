Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  devise_scope :user do
     post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root to: "homes#top"
  get "home/about" =>"homes#about"
  get "search" => "searches#search"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update, :create, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get :followers, on: :member
    get :followeds, on: :member
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
