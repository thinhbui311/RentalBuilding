Rails.application.routes.draw do
  root to: "buildings#index"

  resources :buildings, only: [:index, :show]
  resources :contact_forms, only: [:create]
end
