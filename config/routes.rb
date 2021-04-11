Rails.application.routes.draw do
  resources :posts
  root "events#index"
end
