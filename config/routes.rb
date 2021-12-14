Rails.application.routes.draw do
  get 'categories/index'
  get 'search', to: 'categories#search'

  resource :search
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create]
  resources :categories do
    resources :garments
  end

  root 'home#index'
end
