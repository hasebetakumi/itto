# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Classifying.create!(
    classifying: '小学生',
)

Classifying.create!(
    classifying: '中学生',
)

Classifying.create!(
    classifying: '高校生',
)

School.create!(
    classifying: 2,
    school: 'テスト中学校'
)

Semester.create!(
    semester: '1学期テスト'
)

StudentType.create!(
    student_type: '完璧主義者タイプ'
)

Student.create!(
    classifying: 2,
    grade: 3,
    school_id: 1,
    year: 2005,
    family_name: 'テスト',
    given_name: '太郎',
    family_name_kana: 'テスト',
    given_name_kana: 'たろう',
    student_type_id: 1,
)

Subject.create!(
    subject: '英語'
)
Subject.create!(
    subject: '数学'
)
Subject.create!(
    subject: '国語'
)
Subject.create!(
    subject: '理科'
)
Subject.create!(
    subject: '社会'
)

Test.create!(
    test: '1学期中間'
)

User.create!(
    email: 'pro.only.21@gmail.com',
    password: 'Password-1',
    confirmed_at: '2021-01-11 13:09:40',
    confirmation_sent_at: '2021-01-11 13:09:22',
    right: '1',
    name: 'テスト'
    )
User.create!(
    email: 'aaa@gmail.com',
    password: 'Password-1',
    confirmed_at: '2021-01-11 13:09:40',
    confirmation_sent_at: '2021-01-11 13:09:22',
    right: '1',
    name: 'テスト01'
    )