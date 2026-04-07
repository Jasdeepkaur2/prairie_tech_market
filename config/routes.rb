Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get, :delete]
  ActiveAdmin.routes(self)

  root "pages#home"
  get "about", to: "pages#about"
  get "contact", to: "pages#contact"

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]

  resource :cart, only: [:show] do
    post :add_item
    patch :update_item
    delete :remove_item
  end

  resources :orders, only: [:index, :show, :new, :create]

  get "search", to: "products#search", as: :search
end
