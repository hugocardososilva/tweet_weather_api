# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from Exception, with: :catching_errors

  def record_not_found
    render json: { errors: { base: ['Error'] } }, status: :unprocessable_entity
  end
end
