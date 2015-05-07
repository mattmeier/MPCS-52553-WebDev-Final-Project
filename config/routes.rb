Rails.application.routes.draw do
    
    root 'users#index'
      
    #########################################################
    # The "Golden 7" for accessing the "users" resource
    
    
    get '/users/new' => 'users#new', as: 'new_user'
    post '/users' => 'users#create', as: 'users'
    
    get '/users' => 'users#index'
    get '/users/:id' => 'users#show', as: 'user'
    
    get '/users/:id/edit' => 'users#edit', as: 'edit_user'
    patch '/users/:id' => 'users#update'
    
    delete '/users/:id' => 'users#destroy'
    
end
