Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :toys do
    resources :rents, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rents, only: [:index, :show, :delete, :edit, :update, :destroy]
end
