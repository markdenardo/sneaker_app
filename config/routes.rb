  Rails.application.routes.draw do
      resources :shops
      resources :users
      resources :sneakers

      root to: 'shops#index'

    # resources :shops, only: [:index, :new, :create, :show,]
    # resources :users, only: [:index, :show, :new,]
    # resources :sneakers, only: [:index, :show,]
  end
