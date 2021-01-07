class Student < ApplicationRecord
    belongs_to :school
    belongs_to :student_type
    has_many :reports
    has_many :results
    has_many :testresults
    has_many :targets
    
    def name
        "#{family_name} #{given_name}"
    end
end
