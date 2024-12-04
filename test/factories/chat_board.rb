FactoryBot.define do
    factory :chat_board do
      content { "MyString" }
      association :user
      association :post
    end
  end
