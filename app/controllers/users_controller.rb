class UsersController < ApplicationController

  def twitter_authenticate
    client = TwitterOAuth::Client.new(
      :consumer_key => ENV["twitter_consumer_key"],
      :consumer_secret => ENV["twitter_consumer_secret"]
      )
    result_url = oauth_result_path(only_path: false)
    request_token = client.request_token(:oauth_callback => result_url)

    redirect_to request_token.authorize_url
  end

def oauth_result
  client = TwitterOAuth::Client.new(
    :consumer_key => 'YOUR KEY',
    :consumer_secret => 'YOUR SECRET'
  )

  access_token = client.authorize(
    params[:oauth_token],
    'YOUR SECRET',
    :oauth_verifier => params[:oauth_verifier]
  )

  # Save to your database:
  # access_token.token
  # access_token.secret

  # Once you save that in the DB, in another route you can do:

  # client = TwitterOAuth::Client.new(
  #   :consumer_key => 'YOUR KEY',
  #   :consumer_secret => 'YOUR SECRET',
  #   :token => current_user.twitter_token,
  #   :secret => current_user.twitter_secret
  # )

  # Get user's timeline like this:
  # client.home_timeline(count: 50)

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



end