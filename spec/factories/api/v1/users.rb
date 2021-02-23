FactoryBot.define do
  factory :api_v1_user, class: 'Api::V1::User' do
    username { "MyString" }
    email { "MyString" }
    name { "MyString" }
    password { "MyString" }
  end
end
