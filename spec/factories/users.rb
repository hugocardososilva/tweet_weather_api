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
                          openwather_key: Rails.application.credentials.config[:open_weather_api_key],
                          twitter_access_token: Rails.application.credentials.config[:twitter_access_token],
                          twitter_access_token_secret: Rails.application.credentials.config[:twitter_access_token_secret],
                          units: 'metric',
                          user: user
                          )
      end
    end

    trait :with_bad_keys do
      after :create do |user|
        FactoryBot.create(:setting,
                          openwather_key: 'asdj0123je0239jd0sjd0a9jsd09jasd',
                          twitter_access_token: 'asdj0123je0239jd0sjd0a9jsd09jasd',
                          twitter_access_token_secret: 'asdj0123je0239jd0sjd0a9jsd09jasd',
                          units: 'metric',
                          user: user
        )
      end
    end

  end
end
