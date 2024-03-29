Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations:
    'users/registrations' }
  # get 'pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
  resources :lists do
    resources :bookmarks, only: %i[create new destroy]
  end
end
