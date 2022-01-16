Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  root to: "homes#top"
  get "home/about" =>"homes#about"
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end

  namespace :admin do
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
  end

  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
