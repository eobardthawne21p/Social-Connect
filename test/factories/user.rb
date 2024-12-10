FactoryBot.define do
  factory :user do
    name { "MyString" }
    username { "MyString" }
    password { "Password@1" }
    password_confirmation { "Password@1" }
    birthday { "2024-09-17" }
    role { "user" }

    trait :admin do
      role { "admin" }
    end

    trait :moderator do
      role { "moderator" }
    end
  end
end
