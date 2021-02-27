require_relative '../../lib/twitter_api/twitter_api'

class Twitterize
  def initialize(options = {})
    @options = options
    @params = @options[:params]
    @tweet = @options[:tweet]
  end

  def send_twitter
    message = send_message(@tweet.message)
    if message
      @tweet.update(status: "done")
    else
      @tweet.update(status: "error")
      @tweet.errors.add :base, :invalid
    end
  end

  private

  def send_message(message)
    twitter_api.new({ tweet:@tweet }).send_twitter message
  end

  def twitter_api
    TwitterApi
  end
end