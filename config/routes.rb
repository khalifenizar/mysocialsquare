Rails.application.routes.draw do
  # devise_for :views
  devise_for :users
  resources :users, only: [:update, :edit]

get '/' =>'users#social_network_signup'

get '/twitter' => 'users#twitter_authenticate'

get '/oauth_result' => 'users#oauth_result'

get '/posts' => 'posts#post_home'
end
