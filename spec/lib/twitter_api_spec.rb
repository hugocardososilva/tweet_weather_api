# frozen_string_literal: true

require 'rails_helper'
require_relative '../../lib/twitter_api/twitter_api'

RSpec.describe TwitterApi do
  before(:all) do
    @user = FactoryBot.create(:user, :with_good_keys)
    @tweet = FactoryBot.create(:tweet, user: @user)
  end

  context 'create' do
    it 'check' do
      client = TwitterApi.new({ tweet: @tweet }).client

      expect(client.user_token?).to eq(true)
      expect(client.credentials?).to eq(true)

      expect(client.home_timeline.count).to_not eq(0)
    end
  end
end
