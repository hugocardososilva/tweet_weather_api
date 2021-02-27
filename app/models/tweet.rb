# frozen_string_literal: true

class Tweet < ApplicationRecord
  after_create :build
  after_create :send_twitter
  belongs_to :user

  enum status: { error: 'error', done: 'done' }

  validates :message, :location, presence: true

  private

  def build
    Weather.new({ tweet: self }).build
  end

  def send_twitter
    Twitterize.new({ tweet: self }).send_twitter
  end
end
