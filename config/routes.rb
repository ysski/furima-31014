Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :purchases, only: [:index,:create]
  #resources :users, only: [:index,:new,:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end
