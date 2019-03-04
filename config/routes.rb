Rails.application.routes.draw do
  get 'orders/index'
  get 'orders/show'
  post 'orders/create'
  get 'orders/new'
  resources :products do
  	resources :cart_products, only: [:create, :update, :destroy]
  end
  resources :carts
  devise_for :users
	root to: "home#index"
end
