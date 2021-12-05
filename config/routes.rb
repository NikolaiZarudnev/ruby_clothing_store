
Rails.application.routes.draw do
  get 'categories/index'
  
  resources :categories do
    resources :garments
  end

  root 'categories#index'
end