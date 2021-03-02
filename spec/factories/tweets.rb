# frozen_string_literal: true

FactoryBot.define do
  factory :tweet do
    location { FFaker::AddressBR.city }
    association :user
  end
end
