FactoryBot.define do
  factory :player do
    gender { 1 }
    available_day { 1 }
    prefecture { 1 }
    comment { "よろしくおねがいします" }
    user
  end
end
