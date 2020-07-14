FactoryBot.define do
  factory :team do
    association :user
    association :team
  end
end
