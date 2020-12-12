class ResultsController < ApplicationController
    def index
        @results = Result.where(student_id: params[:student_keyword], grade: params[:grade_keyword], semester_id: params[:semester_keyword])
        @student = params[:student_keyword]
        @grade = params[:grade]
        @semester = params[:semester_keyword]
        @students = Student.all
        @semesters = Semester.all
    end
end
