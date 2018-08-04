require 'resque/server'

Rails.application.routes.draw do

  mount Resque::Server.new, at: "/resque"
  
  namespace :api do

    namespace :v1 do
      get 'home', to: 'posts#home'
      post 'posts/create', to: 'posts#create'
      post 'users/sign_in', to: 'users#sign_in'
    end

    namespace :v2 do
       get 'home', to: 'posts#home'

    end

  end



  get 'users/profile/:id', to: 'users#profile'
  get 'users/search', to: 'users#search'
 

  post 'users/upload_avatar/:id', to: 'users#upload_avatar', as: :user_avatar_upload
  

  post 'likes/toggle/:post_id', to: 'likes#toggle', as: :toggle_like

  post 'comments/create', as: :comments
  delete 'comments/:id', to: 'comments#destroy', as: :destroy_comment

	# Post routes
  root 'posts#home'
  get 'posts/home', to: 'posts#home'
  post 'posts/create', as: :posts
  delete 'posts/:id', to: 'posts#destroy', as: :destroy_post

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end







