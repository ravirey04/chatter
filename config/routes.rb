Rails.application.routes.draw do
  

  resources :rooms
  #get 'pings/home'
  #post 'assigns/create'
  post 'rooms/sessions'
  resources :chatrooms do 
  		resource :chatroom_users
  		resources :messages
  end
  devise_for :users
  root 'chatrooms#index'
  get 'audio'=> "audios#home"
  get "page" => "pages#home"
  get "ping" => "pings#home"
 resources :assigns
 resources :pings
 resources :periods
 resources :direct_messages
 resources :audios
  mount ActionCable.server, at: '/cable'
end
