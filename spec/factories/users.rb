FactoryBot.define do

  factory :user do
    last_name { "田中" }
    first_name { "太郎" }
    nickname { "たろさん" }
    email { "taro@example.com" }
    password { "password" }
  end

end
