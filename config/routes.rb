Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks",
                                    passwords: "users/passwords",
                                    sessions: "users/sessions",
                                    registrations: "users/registrations" }
  resources :users
  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, :index]

  root "home#index"
end
