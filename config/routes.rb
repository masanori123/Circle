Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "users#index"
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :categories, only: [:index, :show] do
    collection do
      get 'search'
      get 'suggest'
    end
  end
  resources :groups, only: [:index, :new, :create, :destroy] do
    resources :messages, only: [:index, :create, :destroy]
  end
end
