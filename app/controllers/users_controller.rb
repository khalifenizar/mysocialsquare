class UsersController < ApplicationController


  # TWITTER

def twitter_authenticate
  # Hey Twitter, here are my app credentials.
  client = TwitterOAuth::Client.new(
    :consumer_key => ENV["twitter_consumer_key"],
    :consumer_secret => ENV["twitter_consumer_secret"]
    )

  # Here is the URL i want the user to visit after they authorize.
  result_url = oauth_result_path(only_path: false)

  # Twitter, can I have a URL for authenticating a user for my app?
  request_token = client.request_token(:oauth_callback => result_url)

  # Redirect the user to that URL.
  redirect_to request_token.authorize_url
end



def oauth_result
  client = TwitterOAuth::Client.new(
    :consumer_key => ENV["twitter_consumer_key"],
    :consumer_secret => ENV["twitter_consumer_secret"]
  )
# User credentials
  access_token = client.authorize(
    params[:oauth_token],
    ENV["twitter_consumer_secret"],
    :oauth_verifier => params[:oauth_verifier]
  )


  client = Twitter::REST::Client.new do |config|
    config.consumer_key = ENV["twitter_consumer_key"]
    config.consumer_secret = ENV["twitter_consumer_secret"]
    config.access_token = access_token.token
    config.access_token_secret = access_token.secret
  end


  current_user.twitter_token = access_token.token
  current_user.twitter_token_secret = access_token.secret
  current_user.twitter_username = client.user.screen_name
  current_user.save


  redirect_to '/'
end



    before_action :authenticate_user!



  def social_network_signup
  end



  def update
    @user.update_attributes(user_params)
  end



  private



  def load_user
    @user = User.find(params[:id])
  end



  def user_params
    params.require(:user).permit(:color)
  end
#############################################################
# FACEBOOK







#############################################################
# INSTAGRAM







#############################################################
end