# frozen_string_literal: true

Rails.application.routes.draw do
  root "books#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :books
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users, only: [:show]
  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
