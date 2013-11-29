Katata::Application.routes.draw do
  #root
  root 'static_pages#home'

  #RESTful resources
  resources :users
  resources :sessions, only: [:new, :create, :destory]

  #mapped paths
  match '/signin', to: 'sessions#new', via: 'get'
  match '/signout', to: 'sessions#destory', via: 'delete'
  match '/signup', to: 'users#new', via: 'get'
  
  #static pages
  match '/help', to: 'static_pages#help', via: 'get'
  match '/about', to: 'static_pages#about', via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  
end