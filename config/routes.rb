
Rails.application.routes.draw do
  get 'categories/index'
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create]
  resources :categories do
    resources :garments
  end

  root 'categories#index'
end