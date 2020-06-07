FactoryBot.define do
  factory :message do
    content { "よろしくおねがいします。" }
    association :user
    association :room
  end
end
