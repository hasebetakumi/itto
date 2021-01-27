FactoryBot.define do
    factory :ittoexam do
        association :user
        association :student
        year {"2020"}
        month {"1"}
        
    end
end