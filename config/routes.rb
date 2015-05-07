Rails.application.routes.draw do
    
    root 'users#index'
    get '/new' => 'users#new'
    post '/' => 'users#create'
    get '/:id' => 'users#show'
    get '/:id/edit' => 'users#edit'
    patch '/:id' => 'users#update'
    delete '/:id' => 'users#destroy'
    
end
