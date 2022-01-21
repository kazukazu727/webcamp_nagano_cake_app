Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  root to: "homes#top"
  get "home/about" =>"homes#about"
  get "admin" => "admin/homes#top"

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
