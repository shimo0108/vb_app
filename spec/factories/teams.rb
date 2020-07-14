FactoryBot.define do
  factory :team do
    name {"望月VBC"}
    gender { 1 }
    available_day { 1 }
    prefecture { 1 }
    comment { "よろしくおねがいします" }
    user
  end
end
