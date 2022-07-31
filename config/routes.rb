Rails.application.routes.draw do
  
  root 'blogs#index'

  get '/blogs', to: 'blogs#index'
  get '/blogs/:id', to: 'blogs#show'

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  
  resources :comments
  resources :blogs
  resources :users

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
