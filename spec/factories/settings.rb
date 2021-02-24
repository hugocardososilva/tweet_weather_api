# frozen_string_literal: true

FactoryBot.define do
  factory :setting do
    openwather_key { 'ASD3248sfdfsdfs98yady983y9as8yd98asyd' }
    twitter_api_key { 'sabsad9823yr9hsdf9s8fh98shdf89hsdfd8sh' }
    lang { Setting.langs.values.sample }
    units { Setting.units.values.sample }

    association :user
  end
end
