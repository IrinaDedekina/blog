Rails.application.routes.draw do
  resources :users, only: [:show, :edit, :update]
  resources :posts
  root "posts#index"
end
