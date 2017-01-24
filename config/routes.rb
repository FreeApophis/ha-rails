Rails.application.routes.draw do
  resources :lights
  root to: 'dashboard#index'

  resource :dashboard, only: [:index]
end
