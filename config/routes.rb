Rails.application.routes.draw do

  namespace :admin do
      resources :users
      resources :carts
      resources :cart_products
      resources :categories
      resources :orders
      resources :products

      root to: "users#index"
    end
  devise_for :users
  root to: "home#index"
  
  resources :users, only: [:show, :update, :edit, :destroy]
  
  resources :products do
    resources :cart_products, only: [:create, :update, :destroy]
  end
  resources :carts, path: 'panier' do
    resources :orders, only: [:index, :show, :create, :new], path: 'commande'
  end
end
