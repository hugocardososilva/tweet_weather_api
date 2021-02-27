# frozen_string_literal: true

require 'rails_helper'
require_relative '../../lib/twitter_api/twitter_api'

RSpec.describe 'Twitterize' do
  before(:all) do
    @user = FactoryBot.create(:user, :with_good_keys)
    @tweet = FactoryBot.build(:tweet, user: @user)
    @client = TwitterApi.new({ tweet: @tweet }).client
  end

  context 'send' do
    it 'check send' do
      @tweet.save!

      expect(@tweet.status).to eq('done')
    end
  end
end
