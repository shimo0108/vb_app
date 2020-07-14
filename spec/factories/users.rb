# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    last_name {'田中'}
    first_name {'太郎'}
    nickname {'たろさん'}
    sequence(:email) { |n| "tester#{n}@example.com" }
    password {'password'}
  end
end