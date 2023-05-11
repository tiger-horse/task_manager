Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :users, only: %i[edit update show]
  resources :rooms do
    resources :categories
    resources :tasks do
      member do
        patch :complete
        patch :unfinished
      end
      collection do
        get 'search'
        get 'week'
      end
      resources :comments, only: %i[create destroy]
    end
  end
end
