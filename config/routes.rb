Rails.application.routes.draw do
  devise_for :users
  root to: 'rooms#index'
  resources :rooms do
    resources :tasks do
      member do
        patch :complete
        patch :unfinished
      end
    end
  end
end
