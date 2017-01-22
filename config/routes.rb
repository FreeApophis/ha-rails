Rails.application.routes.draw do
  root to: 'dashboard#index'

  resource :dashboard, only: [:index]
end
