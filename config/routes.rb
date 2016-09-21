Rails.application.routes.draw do

  root "projects#index"
  resources :projects do 
    resources :pledges, only: [:new]
  end
  resources :users, only: [:show, :new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
