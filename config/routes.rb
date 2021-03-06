# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
                       omniauth_callbacks: "omniauth_callbacks",
                       passwords: "users/passwords",
                       registrations: "users/registrations",

                     }
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :messages, only: [:create]
  resources :rooms, only: %i(create show index)
  resources :players
  resources :teams
  resources :positions
  resources :microposts
  resources :follow_members, only: [:create, :destroy]

  devise_scope :user do
    root :to => "devise/sessions#new"
  end
end
