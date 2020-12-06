class Student < ApplicationRecord
    belongs_to :school
    belongs_to :student_type
    
    def name
        "#{family_name} #{given_name}"
    end
end
