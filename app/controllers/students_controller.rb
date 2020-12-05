class StudentsController < ApplicationController
    def index
        @elementary_students = Student.where(classifying: 1).includes(:school, :student_type).order(grade: :ASC, family_name_kana: :ASC)
        @junior_high_school_students = Student.where(classifying: 2).includes(:school, :student_type).order(grade: :ASC, family_name_kana: :ASC)
        @high_school_students = Student.where(classifying: 3).includes(:school, :student_type).order(grade: :ASC, family_name_kana: :ASC)
        @student = Student.new
    end
    
    def create
        Student.create(student_params)
        @elementary_students = Student.where(classifying: 1).includes(:school, :student_type).order(grade: :ASC, family_name_kana: :ASC)
        @junior_high_school_students = Student.where(classifying: 2).includes(:school, :student_type).order(grade: :ASC, family_name_kana: :ASC)
        @high_school_students = Student.where(classifying: 3).includes(:school, :student_type).order(grade: :ASC, family_name_kana: :ASC)
    end
    
    private
    def student_params
        params.require(:student).permit(:classifying, :grade, :school_id, :year, :family_name, :given_name, :family_name_kana, :given_name_kana, :student_type_id)
    end
end
