FactoryBot.define do
  factory :user do
    name { 'test' }
    sequence(:email) { |n| "test#{n}@example.com" }
    password { 'password' }
    right { '1' }
    confirmed_at { '2021-01-01 00:00:00' }
  end
end
