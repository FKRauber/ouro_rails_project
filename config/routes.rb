Rails.application.routes.draw do
  get 'users/show'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/user'
  get 'users/user_params'
  get 'static_pages/home'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'theories/index'
  get 'theories/show'
  get 'theories/new'
  get 'theories/create'
  get 'theories/edit'
  get 'theories/update'
  get 'theories/destroy'
  get 'treasures/index'
  get 'treasures/show'
  get 'treasures/new'
  get 'treasures/create'
  get 'treasures/edit'
  get 'treasures/update'
  get 'treasures/destroy'
  get 'treasures/treasure'
  get 'treasures/treasure_params'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#home"

  resources :users
  resources :treasures

  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  post "/theories/new", to: "theories#new"
end
