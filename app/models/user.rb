# frozen_string_literal: true

class User < ApplicationRecord
  has_one :setting, dependent: :destroy
  has_many :tweets, dependent: :destroy

  accepts_nested_attributes_for :setting, allow_destroy: true

  validates :username, :email, :name, :password, presence: true
end
