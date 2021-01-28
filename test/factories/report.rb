FactoryBot.define do
    factory :report do
        association :classifying
        association :student
        association :user
        association :subject
        report {"良い"}
    end
end