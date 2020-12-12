Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'mains#index'
    
    resources :reports, only: [:index, :new, :create] 
    resources :schools, only: [:index, :create]
    resources :students, only: [:index, :create]
    resources :results, only: [:index]
end
