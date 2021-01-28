FactoryBot.define do
  factory :testresult do
    association :student
    association :test
    association :user
    grade { '1' }
  end
end
