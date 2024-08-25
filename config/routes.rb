Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'movies', to: 'movie#index'

      post 'session/create'
      delete 'session/destroy'
      
      post '/user/registration', to: 'user#create'
      put 'user/update'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
