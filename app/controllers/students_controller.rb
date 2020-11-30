class StudentsController < ApplicationController
    def index
        @students = Student.all
        @student = Student.new
    end
    
    def create
        School.create(student_params)
        @schools = School.all
    end
    
    private
    def student_params
        params.require(:student).permit(:classifying, :grade, :school_id, :student, :student_type)
    end
end
