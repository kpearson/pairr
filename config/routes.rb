Rails.application.routes.draw do

  root "welcome#index"

  resources :welcome
  resources :matches

  get "/auth/:provider/callback", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
end
