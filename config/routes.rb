Rails.application.routes.draw do
  root 'dashboard#index'
  namespace :api do
    resources :recipes, only: [:index]
  end
end
