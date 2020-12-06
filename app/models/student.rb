class Student < ApplicationRecord
    belongs_to :school
    belongs_to :student_type
    has_many :reports
    
    def name
        "#{family_name} #{given_name}"
    end
end
