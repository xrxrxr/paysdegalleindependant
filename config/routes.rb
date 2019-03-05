Rails.application.routes.draw do

  devise_for :users
  root to: "home#index"
  
  resources :users, only: [:show, :update, :edit, :destroy]
  
  resources :products do
    resources :cart_products, only: [:create, :update, :destroy]
  end
  resources :carts do
    resources :orders, only: [:index, :show, :create, :new]
  end
end
