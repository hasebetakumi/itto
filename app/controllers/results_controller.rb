class ResultsController < ApplicationController
    def index
        if params[:student_keyword].present? and params[:grade_keyword].present? and params[:semester_keyword].present?
            @results = Result.where(student_id: params[:student_keyword], grade: params[:grade_keyword], semester_id: params[:semester_keyword]).includes(:student, :user, :semester)
        else
            @results = Result.all.includes(:student, :user, :semester)
        end
        
        @students = Student.all
        @semesters = Semester.all
    end
end
