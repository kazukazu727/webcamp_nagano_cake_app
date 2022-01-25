Rails.application.routes.draw do
  devise_for :customers
  devise_for :admin
  root to: "homes#top"
  get "about" =>"homes#about"
  get "admin" => "admin/homes#top"

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
  end

  resources :customers, only: [:show, :edit, :update, :unsubscribe, :withdrawal]
  resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  resources :orders, only: [:new, :confirm, :thanks, :create, :index, :show]
  resources :addresses, only:[:index, :edit, :create, :update, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
