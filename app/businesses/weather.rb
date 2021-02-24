require 'open_weather_api/messageable'
class Weather
  def initialize(options = {})
    @options = options
    @params = @options[:params]
    @tweet = @options[:tweet]
  end

  def build
    @message = weather_api.new(weather_params)
  end

  private

  def weather_api
    OpenWeatherApi::Messageable
  end

  def weather_params
    {
      q: @tweet.location,
      units: @tweet.units,
      lang: @tweet.lang,
      appid: @tweet.user.settings.openwather_key
    }
  end
end