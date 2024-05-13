Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'articles#index'

  resources :articles do
    resources :comments
  end
  resources :all_articles, only: [:index]
  resources :tags
end
