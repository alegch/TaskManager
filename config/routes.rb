TaskManager::Application.routes.draw do
  root :to => "stories#index"

  resources :users, :only => [:new, :create]

  resource :session, :only => [:new, :create, :destroy]

  resources :stories do
    resources :comments, :only => [:index, :create]
    member do
      put 'update_state'
    end
  end

end
