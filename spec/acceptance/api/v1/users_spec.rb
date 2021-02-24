# frozen_string_literal: true

require 'acceptance_helper'
require 'rails_helper'

def user_params
  parameter :username, type: :string, parent: 'user', example: FFaker::Internet.user_name, required: true
  parameter :email, type: :string, parent: 'user', example: FFaker::Internet.email, required: true
  parameter :name, type: :string, parent: 'user', example: FFaker::NameBR.name, required: true
  parameter :password, type: :string, parent: 'user', example: rand(99_999_999), required: true

  parameter :setting_attributes, parent: 'setting', type: :array
  parameter :openwather_key, type: :string, parent: 'setting_attributes',
                             example: 'ASD3248sfdfsdfs98yady983y9as8yd98asyd', required: true
  parameter :twitter_api_key, type: :string, parent: 'setting_attributes',
                              example: 'ASD3248sfdfsdfs98yady983y9as8yd98asyd', required: true
  parameter :lang, type: :array, items: { type: :string, enum: Setting.langs.values }, parent: 'setting_attributes', required: true
  parameter :units, type: :array, items: { type: :string, enum: Setting.units.values }, parent: 'setting_attributes', required: true
end

def user_attributes
  let(:username) { FFaker::Internet.user_name }
  let(:email) { FFaker::Internet.email }
  let(:name) { FFaker::NameBR.name }
  let(:password) { rand(99_999_999) }
  let(:setting_attributes) do
    {
      openwather_key: 'ASD3248sfdfsdfs98yady983y9as8yd98asyd',
      twitter_api_key: 'ASD3248sfdfsdfs98yady983y9as8yd98asyd',
      lang: Setting.langs.values.sample,
      units: Setting.units.values.sample,
      user_id: user.id
    }
  end
end

resource 'User' do
  explanation 'User API reference with simple CRUD'

  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'
  header 'Host', 'localhost:3000'

  let(:user) { FactoryBot.create(:user) }
  let(:setting) { FactoryBot.create(:setting) }

  before do
    2.times do |_t|
      FactoryBot.create(:user)
    end
  end

  # example object for show, update and destroy
  let(:user) do
    FactoryBot.create(:user)
  end

  # object id alias
  let(:id) { user.id }

  # index
  get 'api/v1/users' do
    # simulates a request
    example_request 'Index' do
      expect(response_status).to eq(200)
    end
  end

  # show
  get 'api/v1/users/:id' do
    # simulates a request
    example_request 'Show' do
      expect(response_status).to eq(200)
    end
  end

  # create
  post 'api/v1/users' do
    user_params

    user_attributes

    let(:raw_post) { { user: params }.to_json }

    # simulates a request
    example_request 'Create' do
      expect(response_status).to eq(201)
    end
  end

  # update
  put 'api/v1/users/:id' do
    user_params

    user_attributes

    let(:raw_post) { { user: params }.to_json }

    # simulates a request
    example_request 'Update' do
      expect(response_status).to eq(200)
    end
  end

  delete 'api/v1/users/:id' do
    # simulates a request
    example_request 'Destroy' do
      expect(response_status).to eq(204)
    end
  end
end
