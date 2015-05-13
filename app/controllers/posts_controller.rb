class PostsController < ApplicationController

  def post_home
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["twitter_consumer_key"]
      config.consumer_secret = ENV["twitter_consumer_secret"]
      config.access_token = current_user.twitter_token
      config.access_token_secret = current_user.twitter_token_secret
    end
    @posts = client.user_timeline(count:200)
  end
end
