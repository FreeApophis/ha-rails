Rails.application.routes.draw do
  root to: 'dashboards#show'

  resource :dashboard, only: [:show]
  resource :public_transport, only: [:show]

  resources :lights
  resources :recipes, only[:index, :show]
end
