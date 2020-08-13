# frozen_string_literal: true

Rails.application.routes.draw do
  root "books#index"
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :books do
    resources :comments, module: :books
  end
  resources :reports do
    resources :comments, module: :reports
  end
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :users, only: [:show]
  resources :relationships, only: [:create, :destroy]
  get "timeline", to: "timeline#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
