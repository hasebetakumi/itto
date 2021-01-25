FactoryBot.define do
    factory :student do
        association :school
        association :student_type
        classifying {"1"}
        grade {"6"}
        family_name {"テスト"}
    end
end