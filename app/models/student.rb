class Student < ApplicationRecord
    belongs_to :school
    belongs_to :student_type
end
