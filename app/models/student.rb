class Student < ApplicationRecord
    belongs_to :school
    belongs_to :student_type
    has_many :reports
    has_many :results
    has_many :testresults
    has_many :targets
    has_many :ittoexams
    
    def name
        "#{family_name} #{given_name}"
    end
    
    def student_info
        if classifying == 1
            classifying_detail = "小"
        elsif classifying == 2
            classifying_detail = "中"
        elsif classifying == 3   
            classifying_detail = "高"
        else
            classifying_detail = "非"
        end
            
        "#{classifying_detail}　#{grade}年　#{family_name} #{given_name}"
    end
end
