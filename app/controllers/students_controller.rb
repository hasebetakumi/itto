class StudentsController < ApplicationController
    def index
        @elementary_students = Student.where(classifying: 1).includes(:school)
        @junior_high_school_students = Student.where(classifying: 2).includes(:school)
        @high_school_students = Student.where(classifying: 3).includes(:school)
        @student = Student.new
    end
    
    def create
        Student.create(student_params)
        @elementary_students = Student.where(classifying: 1)
        @junior_high_school_students = Student.where(classifying: 2)
        @high_school_students = Student.where(classifying: 3)
    end
    
    private
    def student_params
        params.require(:student).permit(:classifying, :grade, :school_id, :student, :student_type_id)
    end
end
