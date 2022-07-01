Rails.application.routes.draw do
  get "about", to: "about#index"

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#creasate"
  
  root to: "main#index"
end
