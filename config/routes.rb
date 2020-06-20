# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
                       omniauth_callbacks: "omniauth_callbacks",
                       passwords: "users/passwords",
                       registrations: "users/registrations",
                     }
  resources :users
  resources :messages, only: [:create]
  resources :rooms, only: %i(create show index)
  resources :players
  resources :positions

  root "users#index"
end
