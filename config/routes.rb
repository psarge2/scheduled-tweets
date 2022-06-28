Rails.application.routes.draw do
  get "about", to: "about#index"

  # get "/"
  root to: "main#index"
end
