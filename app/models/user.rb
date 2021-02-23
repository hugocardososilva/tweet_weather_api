class User < ApplicationRecord
  has_one :setting

  accepts_nested_attributes_for :setting, allow_destroy: true
end
