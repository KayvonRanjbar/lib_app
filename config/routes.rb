Rails.application.routes.draw do
  get 'library_users/index'

  root to: "users#index"

  get "/users", to: "users#index", as: "users"
  get "/users/new", to: "users#new", as: "new_user"
  post "/users", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"
  get "/login", to: "sessions#new"
  get '/logout', to: 'sessions#destroy' # <--This isn't restFul bc it should be DELETE
  post '/sessions', to: 'sessions#create'
  get "/libraries", to: "libraries#index"
  get "/libraries/new", to: "libraries#new", as: "new_library"
  post "/libraries", to: "libraries#create"
  get "/libraries/:id", to: "libraries#show", as: "library"
  get "/users/:user_id/libraries", to: "library_users#index", as: "user_libraries"

end