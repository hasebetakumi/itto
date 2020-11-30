class StudentsController < ApplicationController
    def index
        @students = Student.all
        @student = Student.new
    end
end
