FactoryBot.define do
  factory :ittoexam do
    association :user
    association :student
    year { '2022' }
    month { '2' }
      
  end
end
