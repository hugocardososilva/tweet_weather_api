require 'rspec_api_documentation/dsl'
require 'rails_helper'
require 'rspec_api_documentation'
require_relative '../lib/acceptance/auto_generate'

RspecApiDocumentation.configure do |config|
  include AutoGenerate

  # Set the application that Rack::Test uses
  config.app = Rails.application

  # An array of output format(s).
  # Possible values are :json, :html, :combined_text, :combined_json,
  #   :json_iodocs, :textile, :markdown, :append_json, :slate,
  #   :api_blueprint, :open_api
  config.format = [:json]

  # Used when adding a cURL output to the docs
  config.curl_host = 'http://localhost:3000'

  # Used when adding a cURL output to the docs
  # Allows you to filter out headers that are not needed in the cURL request,
  # such as "Host" and "Cookie". Set as an array.
  config.curl_headers_to_filter = ["Authorization"]

  # Change the name of the API on index pages
  config.api_name = "TWEET MY WEATHER" # Your API name

  # By default, when these settings are nil, all headers are shown,
  # which is sometimes too chatty. Setting the parameters to an
  # array of headers will render *only* those headers.
  config.request_headers_to_include = ["Host", "Content-Type"]
  config.response_headers_to_include = ["Host", "Content-Type"]

  # By default examples and resources are ordered by description. Set to true keep
  # the source order.
  config.keep_source_order = true

  config.curl_host = nil

end