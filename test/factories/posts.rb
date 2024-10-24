FactoryBot.define do
  factory :post do
    title { "MyString" }
    description { "MyString" }
    image { "MyString" }
    location { "MyString" }
    timeDate { Time.new(2012, 12, 19, 1, 3, 25) } # Use a Time object directly
    likes { 10 }  # Using an integer for likes
    association :user
  end
end
