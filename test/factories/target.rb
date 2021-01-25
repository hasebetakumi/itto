FactoryBot.define do
    factory :target do
        association :user
        association :student
    end
end