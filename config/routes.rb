Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms do
    resources :categories
    resources :tasks do
      member do
        patch :complete
        patch :unfinished
      end
      collection do
        get 'search'
        get "week"
      end
    end
  end
end
