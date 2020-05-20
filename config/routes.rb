Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  root 'pages#index'
  get  'pages/show'


 
=======
  resources :players
  devise_for :users, controllers: {
    :omniauth_callbacks => "omniauth_callbacks",
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }
  resources :users

  root 'start_page#home'
  get 'start_page/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> playerClass
end
