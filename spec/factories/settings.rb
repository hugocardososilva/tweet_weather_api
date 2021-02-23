FactoryBot.define do
  factory :setting do
    openwather_key { "MyString" }
    twitter_api_key { "MyString" }
    lang { "MyString" }
    metric { "MyString" }
  end
end
