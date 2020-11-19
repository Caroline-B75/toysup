Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # get 'toys/category1', to: 'toys#show_0_2_ans', as: :category_1
  resources :toys do
    resources :rents, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :rents, only: [:index, :show, :delete, :edit, :update, :destroy]
  get 'users/toys', to: "toys#show_user_toy", as: :user_toys
  get 'users/demands', to: "rents#show_user_rent_demands", as: :user_rent_demands
  patch 'users/rents/:id/validated', to: 'rents#validate_rent', as: :accept_rent
  patch 'users/rents/:id/refused', to: 'rents#refuse_rent', as: :refuse_rent
end
