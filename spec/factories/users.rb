FactoryBot.define do
    factory :user, class: User do
    id { 10 }
    username { 'test1' }
    email { 'test1@a.com' }
    password { 'hogehoge' }
    introduce { 'aaaaaaaa' }
  end

  factory :second_user, class: User do
    id { 20 }
    username { 'test2' }
    email { 'test2@a.com' }
    password { 'hogehoge' }
    introduce { 'bbbbbbb' }
  end

  factory :therd_user, class: User do
    id { 30 }
    username { 'test3' }
    email { 'test3@a.com' }
    password { 'hogehoge' }
    introduce { 'ccccccc' }
  end
end