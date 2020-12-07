Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'mains#index'
    
    resources :reports, only: [:index, :new, :create] do
    resources :schools, only: [:index, :create]
    resources :students, only: [:index, :create]
end
