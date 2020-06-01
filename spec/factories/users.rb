FactoryBot.define do

  # Userモデルのテストデータaliceを定義
  factory :user do
    last_name { "田中" }
    first_name { "太郎" }
    nickname { "たろさん" }
    email { "taro@taro.com" }
    password { "password" }
  end
end
