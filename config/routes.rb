
Rails.application.routes.draw do
  get 'categories/index'
  resources :users, only: %i[new create]
  resources :categories do
    resources :garments
  end

  root 'categories#index'
end