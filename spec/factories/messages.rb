FactoryBot.define do
  factory :message do
    content { "よろしくおねがいします。" }
    user
    room
  end
end
