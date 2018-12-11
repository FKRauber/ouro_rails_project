Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "static_pages#home"

  resources :users
  resources :treasures do 
    resources :theories
  end


  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  post "/sessions/create", to: "sessions#create"
  delete "/signout", to: "sessions#destroy"
  post "/theories/new", to: "theories#new"
end
