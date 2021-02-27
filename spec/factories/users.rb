# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { FFaker::Internet.user_name }
    email { FFaker::Internet.email }
    name { FFaker::NameBR.name }
    password { rand 99_999_999 }

    trait :with_good_keys do
      after :create do |user|
        FactoryBot.create(:setting,
                          openwather_key: ENV['WEATHER_API'] || 'c26591317877a7d9348e3b745aee5b8b',
                          twitter_api_key: ENV['TWITTER_API'] || 'vFnNSZwEFtws89c3m36yIgIqz',
                          units: 'metric',
                          user: user
                          )
      end
    end

    trait :with_bad_keys do
      after :create do |user|
        FactoryBot.create(:setting,
                          openwather_key: 'asdj0123je0239jd0sjd0a9jsd09jasd',
                          twitter_api_key: 'asdj0123je0239jd0sjd0a9jsd09jasd',
                          units: 'metric',
                          user: user
        )
      end
    end

  end
end
