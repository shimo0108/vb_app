Rails.application.routes.draw do
  root 'start_page#home'
  get 'start_page/show'
    
    resources :teams


  devise_for :users, controllers: {
    :omniauth_callbacks => "omniauth_callbacks",
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }
  
    
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
