Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  resources :users, only: [:index, :show, :edit ,:update]
  resources :categories, only: [:index, :show, :new] do
    resources :groups, only: [ :new, :create, :show, :edit] do
      resources :messages, only: [ :create]
    end
  end
end

