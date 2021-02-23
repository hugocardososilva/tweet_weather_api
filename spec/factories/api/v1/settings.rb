FactoryBot.define do
  factory :api_v1_setting, class: 'Api::V1::Setting' do
    openwather_key { "MyString" }
    twitter_api_key { "MyString" }
    lang { "MyString" }
    metric { "MyString" }
  end
end
