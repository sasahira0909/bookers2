Rails.application.routes.draw do

  devise_for :users
  root to:'homes#top'
  resources :books, only: [:index, :create, :show, :destroy, :edit, :update ]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, only: [:index, :show, :edit, :update]

end