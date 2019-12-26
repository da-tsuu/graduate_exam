FactoryBot.define do
  factory :post1, class: Post do
    content { "卍卍卍" }
    user_id { 10 }
  end

  factory :post2, class: Post do
    content { "VIDEOVIDEO" }
    user_id { 10 }
  end

  factory :post3, class: Post do
    content { "MANIAMANIA" }
    user_id { 10 }
  end
end
