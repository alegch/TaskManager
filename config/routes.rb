TaskManager::Application.routes.draw do
  root :to => "web/stories#index"

  scope :module => :web do
    resources :users, :only => [:new, :create]

    resource :session, :only => [:new, :create, :destroy]

    resources :stories do
      resources :comments, :only => [:create]
      member do
        put 'update_state'
      end
    end
  end
end
