Rails.application.routes.draw do
  root to: 'dashboards#show'

  resource :dashboard, only: [:show]
  resource :public_transport, only: [:show]

  resources :images, only: [:index] do
    collection do 
      get 'random'
    end
  end

  resources :lights do
    member do 
      put 'on', :defaults => { :format => 'json' }
      put 'off', :defaults => { :format => 'json' }
    end
  end

  resources :light_groups do
    member do 
      put 'on', :defaults => { :format => 'json' }
      put 'off', :defaults => { :format => 'json' }
    end
  end

  resources :recipes, only: [:index, :show]
end
