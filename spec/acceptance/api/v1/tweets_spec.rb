# frozen_string_literal: true

require 'acceptance_helper'
require 'rails_helper'

def tweet_params
  parameter :status, type: :array, items: { type: :string, enum: Tweet.statuses.values }, parent: 'tweet'
  parameter :message, type: :text, parent: 'tweet', example: FFaker::Lorem.characters(140), required: true
  parameter :location, type: :text, parent: 'tweet', example: FFaker::AddressBR.city, required: true
  parameter :user_id, type: :integer, parent: 'tweet', example: 1, required: true
end

def tweet_attributes
  let(:status) { 'done' }
  let(:message) { FFaker::Lorem.characters(140) }
  let(:location) { FFaker::AddressBR.city }
  let(:user_id) { FactoryBot.create(:user, :with_good_keys).id }
end

resource 'Tweet' do
  explanation 'Tweet API reference '

  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  header 'Host', 'localhost:3000'

  let(:user) { FactoryBot.create(:user, :with_good_keys) }
  let(:tweet) { FactoryBot.create(:tweet, user: user) }

  before do
    2.times do |_t|
      FactoryBot.create(:tweet, user: FactoryBot.create(:user, :with_good_keys))
    end
  end

  # example object for show, update and destroy
  let(:tweet) do
    FactoryBot.create(:tweet, user: FactoryBot.create(:user, :with_good_keys))
  end

  # object id alias
  let(:id) { tweet.id }

  # index
  get 'api/v1/tweets' do
    # simulates a request
    example_request 'Index' do
      expect(response_status).to eq(200)
    end
  end

  # show
  get 'api/v1/tweets/:id' do
    # simulates a request
    example_request 'Show' do
      expect(response_status).to eq(200)
    end
  end

  # create
  post 'api/v1/tweets' do
    tweet_params

    tweet_attributes

    let(:raw_post) { { tweet: params }.to_json }

    # simulates a request
    example_request 'Create' do
      expect(response_status).to eq(201)
    end
  end
end
