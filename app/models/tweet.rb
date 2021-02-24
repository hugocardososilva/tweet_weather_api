# frozen_string_literal: true

class Tweet < ApplicationRecord
  after_create :build
  belongs_to :user

  enum status: { error: 'error', done: 'done' }

  validates :message, :location, presence: true

  private

  def build
    Weather.new( { tweet: self } ).build
  end
end
