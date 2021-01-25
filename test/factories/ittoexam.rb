FactoryBot.define do
    factory :ittoexam do
        year {"2020"}
        month {"1"}
        association :user
        association :student
    end
end