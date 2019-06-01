Rails.application.routes.draw do
  resources :photos
  devise_for :users
  root 'pages#landing'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'profiles/my_photos'
  get 'profiles/subscribes_list'
  get 'profiles/friends_photos'
  get 'profiles/liked_photos'

  get 'pages/about'
  get 'pages/random'
  
  get 'pages/search'
  post 'pages/search' => 'pages#search_results', as: "search_results"
  
  get '/profiles/:id' => 'profiles#show', as: "profile"
  get '/profiles/:id/subscribe' => 'profiles#subscribe', as: "subscribe_profile"
  get '/profiles/:id/unsubscribe' => 'profiles#unsubscribe', as: "unsubscribe_profile"

  get '/photos/:id/write_comment' => 'photos#new_comment', as: "write_comment"  
  post '/photos/:id' => 'photos#new_comment'

  get '/photos/:id/like' => 'photos#like', as: "like_photo"
  get '/photos/:id/unlike' => 'photos#unlike', as: "unlike_photo"

  get '/pages/theme1' => 'pages#change_theme_1'
  get '/pages/theme0' => 'pages#change_theme_0'


end