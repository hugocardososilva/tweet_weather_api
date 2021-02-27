class TwitterApi

  def initialize(options = {})
    @options = options
    @tweet = @options[:tweet]
  end

  def client
    get_client
  end

  def send_twitter(message)
    get_client.update message
  end

  private

  def get_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials.config[:twitter_api_key]
      config.consumer_secret     = Rails.application.credentials.config[:twitter_api_secret_key]
      config.access_token        = @tweet.user.setting.twitter_access_token
      config.access_token_secret = @tweet.user.setting.twitter_access_token_secret
    end
  end

end