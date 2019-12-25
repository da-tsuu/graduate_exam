FactoryBot.define do
  factory :comment do
    image { "MyText" }
    message { "MyString" }
    user_id { 1 }
    post_id { 1 }
  end
end
