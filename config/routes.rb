Rails.application.routes.draw do
  # get 'pages/home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'pages#home'
  get '/lists', to: 'lists#index'
  get '/lists/new', to: 'lists#new'
  post '/lists', to: 'lists#create'
  get 'lists/:id', to: 'lists#show', as: :list
end
