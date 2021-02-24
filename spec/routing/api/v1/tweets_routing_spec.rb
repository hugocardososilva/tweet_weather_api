# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::TweetsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/tweets').to route_to('api/v1/tweets#index')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/tweets/1').to route_to('api/v1/tweets#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v1/tweets').to route_to('api/v1/tweets#create')
    end
  end
end
