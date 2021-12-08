Rails.application.routes.draw do
  namespace :api do
    resources :recipes, only: [:index]
  end
end
