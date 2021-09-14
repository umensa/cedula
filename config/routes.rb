Rails.application.routes.draw do
  resources :participants
  resources :sessions
  resources :mentors

  root to: "sessions#index"
end
