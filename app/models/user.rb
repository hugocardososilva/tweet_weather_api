# frozen_string_literal: true

class User < ApplicationRecord
  has_one :setting, dependent: :destroy

  accepts_nested_attributes_for :setting, allow_destroy: true
end
