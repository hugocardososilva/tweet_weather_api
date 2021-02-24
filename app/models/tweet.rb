# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user

  enum status: { error: 'error', done: 'done' }

  validates :message, presence: true
end
