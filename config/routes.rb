Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/movies', to: 'movie#index'
      get '/movies/:id', to: 'movie#show'

      post '/session/create', to: "session#create"
      delete '/session/destroy', to: "session#destroy"
      
      post '/user/registration', to: 'user#create'
      put '/user/update', to: 'user#update'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
