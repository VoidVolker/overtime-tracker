Rails.application.routes.draw do
  resources :audit_logs, expect: [:new, :edit, :destroy] do
    member do
      get :confirm
    end
  end

  namespace :admin do
    resources :users
    resources :employees
    resources :admin_users
    resources :posts

    root to: "users#index"
  end

  resources :posts do
    member do
      get :approve
    end
  end

  devise_for :users, skip: [:registrations]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static#home'
end
