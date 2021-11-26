Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  root to: "homes#top"
  get "home/about" =>"homes#about"
  resources :genres, only: [:index, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
