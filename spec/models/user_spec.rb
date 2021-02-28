# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { is_expected.to have_one(:setting) }
    it { is_expected.to have_many(:tweets) }
  end

  context 'validates' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:name) }
  end
end
