FactoryBot.define do
  factory :user do
    username { FFaker::Internet.user_name }
    email { FFaker::Internet.email }
    name { FFaker::NameBR.name }
    password { rand 99999999 }

    after :create do |user|
      FactoryBot.create(:setting, user: user)
    end
  end
end
