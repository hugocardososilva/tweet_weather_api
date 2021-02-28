# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  context 'validates' do
    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:location) }
  end
end
