FactoryBot.define do
  factory :student do
    association :school
    association :student_type
    classifying { '1' }
    grade { '6' }
    family_name { '試験' }
    given_name { '太郎' }
    family_name_kana { 'しけん' }
    given_name_kana { 'たろう' }
  end
end
