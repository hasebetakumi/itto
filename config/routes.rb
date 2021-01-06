Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'mains#index'
    
    resources :users, only: [:show]
    resources :reports, only: [:index, :new, :create, :edit, :update, :delete] 
    resources :schools, only: [:index, :create]
    resources :students, only: [:index, :create ,:show, :edit, :update]
    resources :results, only: [:index, :new, :create, :edit, :update]
    resources :testresults, only: [:index, :new, :create, :edit, :update]
end
