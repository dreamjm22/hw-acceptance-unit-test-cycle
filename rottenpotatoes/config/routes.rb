Rottenpotatoes::Application.routes.draw do
  resources :movies do
    member do
        get 'show_directors'
    end
  root :to => 'movies#index'
  end
end
