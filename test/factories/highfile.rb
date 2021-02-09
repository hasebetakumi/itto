FactoryBot.define do
  factory :highfile do
    association :user
    association :student
  end
end
