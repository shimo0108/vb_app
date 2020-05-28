Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks",
                                    passwords: "users/passwords",
                                    sessions: "users/sessions",
                                    registrations: "users/registrations" }

  root "home#index"
end
