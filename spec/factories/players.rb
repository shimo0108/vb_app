FactoryBot.define do
  factory :player do
    gender { 1 }
    position { 1 }
    comment { "MyText" }
    user_id { "" }
    available_day { 1 }
    prefecture { 1 }
  end
end
