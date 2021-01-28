FactoryBot.define do
  factory :result do
    association :student
    association :user
    association :semester
    grade { '1' }
  end
end
