require 'open_weather_api/messageable'
class Weather
  def initialize(options = {})
    @options = options
    @params = @options[:params]
    @tweet = @options[:tweet]
  end

  def build
    messageable_tweet
  end

  private

  def messageable_tweet
    @message = weather_api.new(weather_params)
    if @message.forecast.cod == "200"
      @tweet.message = @message.prevision
    else
      @tweet.message = @message.forecast.message
      @tweet.status = 'error'
      @tweet.errors.add :base, @message.forecast.message
    end
    @tweet
  end

  def weather_api
    OpenWeatherApi::Messageable
  end

  def weather_params
    {
      q: @tweet.location,
      units: @tweet.user.setting.units,
      lang: @tweet.user.setting.lang,
      appid: @tweet.user.setting.openwather_key
    }
  end
end