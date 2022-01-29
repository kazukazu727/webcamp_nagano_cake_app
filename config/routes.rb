Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
}
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
}

  root to: "homes#top"
  get "about" =>"homes#about"
  get "admin" => "admin/homes#top"
  get "customer/mypage" => "customers#show"

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
  end


    resources :customers, only: [:edit, :update, :unsubscribe, :withdrawal]
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :orders, only: [:new, :confirm, :thanks, :create, :index, :show]
    resources :addresses, only:[:index, :edit, :create, :update, :destroy]
    resources :items, only:[:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
