Rails.application.routes.draw do

  root "matches#index"

  resources :users, only: [:edit, :update]
  resources :welcome, only: :index
  resources :matches, only: [:index, :new, :update,]

  post "/matches", to: "matches#create", as: "matcher"

  get "/auth/:provider/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
