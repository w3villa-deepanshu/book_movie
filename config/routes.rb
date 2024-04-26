Rails.application.routes.draw do
  resources :payments,only: [:new, :create]
  resources :bookings ,only: [:new, :create, :show, :index]do
    member do
      patch :cancel_booking
    end

    collection do
      get :all_bookings
    end
  end

  resources :shows, only: [:new, :create, :edit, :update]
  devise_for :users
  resources :movies
  root to: 'movies#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
