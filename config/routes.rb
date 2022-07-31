Rails.application.routes.draw do
  
  # ROOT
  root 'blogs#index'

  # USERS
  get "/me", to: "users#show"
  post "/signup", to: "users#create"
  
  # SESSIONS
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  # BLOGS
  get '/blogs', to: 'blogs#index'
  get '/blogs/:id', to: 'blogs#show'

  # COMMENTS

  # RESOURCES
  resources :comments
  resources :blogs
  resources :users

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
