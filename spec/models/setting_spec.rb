# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Setting, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'validates' do
    it { should validate_presence_of(:openwather_key) }
    it { should validate_presence_of(:twitter_access_token) }
    it { should validate_presence_of(:twitter_access_token_secret) }
    it { should validate_presence_of(:lang) }
    it { should validate_presence_of(:units) }
  end
end
