Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "lands/select", to: "lands#select"
  put "lands/select", to: "lands#attach_owner", as: 'land_attach_owner'


  resources :lands do
    resources :bookings, only: [:new, :create]
    resources :land_periodes, only: [:new, :create]
  end
  resources :bookings, only: [:show, :index]
  resources :land_periodes, only: [:index] do
    resources :bookings, only: [:create]
  end

end
