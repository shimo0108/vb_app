FactoryBot.define do

  # Userモデルのテストデータaliceを定義
  factory :user do
    last_name { "田中" }
    first_name { "太郎" }
    nickname { "たろさん" }
    sequence(:email) { |n|"test#{n}@example.com" }
    password { "password" }
  end
end
