FactoryBot.define do
  factory :user do
    name { "MyString" }
    username { "MyString" }
    password { "password123" }
    password_confirmation { "password123" }
    birthday { "2024-09-17" }
  end
end
