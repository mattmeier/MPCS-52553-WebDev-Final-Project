Rails.application.routes.draw do
    
    root 'users#index'

    get 'password_resets/new'

    get '/history/clear' => 'histories#destroy'
    
    ##### Sign Up and Sign In and Sign Out
    get "/signup" => 'users#new'
    post "/users" => 'users#create'
    
    get "/login" => 'sessions#new'
    post '/sessions' => 'sessions#create'

    delete "/logout" => 'sessions#destroy'

    post '/eventsignups/:event_id'  => 'eventsignups#create'
    delete '/eventsignups/:event_id'  => 'eventsignups#destroy'
      
    #########################################################
    # The "Golden 7" for accessing the "users" resource
    
    resources :users
    resources :password_resets
    # get '/users/new' => 'users#new', as: 'new_user'
    # post '/users' => 'users#create', as: 'users'
    
    # get '/users' => 'users#index'
    # get '/users/:id' => 'users#show', as: 'user'
    
    # get '/users/:id/edit' => 'users#edit', as: 'edit_user'
    # patch '/users/:id' => 'users#update'
    
    # delete '/users/:id' => 'users#destroy'
    
    resources :locations
    resources :universities
    resources :events

end
