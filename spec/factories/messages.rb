# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    content { 'よろしくおねがいします。' }
    user
    room
  end
end
