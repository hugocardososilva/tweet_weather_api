FactoryBot.define do
  factory :tweet do
    status { "done" }
    message { FFaker::Lorem.characters 140 }

    association :user
  end
end
