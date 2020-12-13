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
    
    def new
        @result = Result.new
    end
    
    def create
        Result.create(create_params)
        redirect_to results_path
    end
    
    private
    def create_params
        params.require(:result).permit(:student_id, :grade, :semester_id, :english, :math, :japanese, :science, :social, :art, :pe, :techhome, :music).merge(user_id: current_user.id)
    end
end
