Rails.application.routes.draw do
  devise_for :users, controllers: {
    :omniauth_callbacks => "omniauth_callbacks",
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }

  resources :players

  root 'start_page#index'
  get  'start_page/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
