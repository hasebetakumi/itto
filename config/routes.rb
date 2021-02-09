Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'mains#index'
    
    resources :users, only: [:show, :index]
    resources :reports, only: [:index, :new, :create, :edit, :update, :destroy] 
    resources :schools, only: [:index, :create]
    resources :students, only: [:index, :create ,:show, :edit, :update]
    resources :results, only: [:index, :new, :create, :edit, :update]
    get 'allresults' => 'results#allresult'
    get 'noresults' => 'results#noresult'
    resources :testresults, only: [:index, :new, :create, :edit, :update]
    get 'alltestresults' => 'testresults#alltestresult'
    get 'notestresults' => 'testresults#notestresult'
    resources :targets, only: [:new, :create, :destroy]
    resources :ittoexams, only: [:index, :new, :create, :edit, :update]
    resources :highfiles, only: [:new, :create, :destroy]
end
