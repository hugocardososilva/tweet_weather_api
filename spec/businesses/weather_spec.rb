require 'rails_helper'

RSpec.describe "Weather" do

  before (:all) do
    @user = FactoryBot.create(:user, :with_good_keys)
    @tweet = FactoryBot.create(:tweet, user: @user, status: nil)
  end

  context 'message good' do

    it 'check message status' do
      expect(@tweet.status).to eq('done')
    end

    it 'check if message is not empty' do
      expect(@tweet.message).to_not eq(nil)
    end

  end

  context 'message bad' do
    before do
      user = FactoryBot.create(:user, :with_bad_keys)
      @tweet = FactoryBot.create(:tweet, user: user, status: nil)
    end

    it 'check message error' do
      expect(@tweet.status).to eq('error')
    end

    it 'check has errors' do
      expect(@tweet.errors.empty?).to eq(false)
    end


    it 'check if message is not empty' do
      expect(@tweet.message).to_not eq(nil)
    end

  end
end