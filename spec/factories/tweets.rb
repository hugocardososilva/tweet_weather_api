# frozen_string_literal: true

FactoryBot.define do
  factory :tweet do
    message { FFaker::Lorem.characters 140 }
    location { FFaker::AddressBR.city }

    association :user
  end
end
