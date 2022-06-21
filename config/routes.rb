Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:new, :create]
  resources :beers_category, only: [:index]
  resources :favorites, only: [:index]
  resources :beers, only: [:index, :show] do
    resources :favorites, only: [:create]
    resources :reviews, only: [:index, :new, :create]
    resources :recipes, only: [:index]
    resources :shops, only: [:index, :show]
  end
  resources :recipes_category, only: [:index]
  resources :recipes, only: [:index, :show] do
    resources :favorites, only: [:create]
    resources :reviews, only: [:index, :new, :create]
    resources :beers, only: [:index]

  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
