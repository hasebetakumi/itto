class StudentsController < ApplicationController
    def index
        @students = Student.all
        @student = Student.new
    end
    
    def create
        Student.create(student_params)
        @students = Student.all
    end
    
    private
    def student_params
        params.require(:student).permit(:classifying, :grade, :school_id, :student, :student_type)
    end
end
