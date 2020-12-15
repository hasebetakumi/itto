class ResultsController < ApplicationController
    def index
        if params[:student_keyword].present? and params[:grade_keyword].present? and params[:semester_keyword].present?
            @results = Result.where(student_id: params[:student_keyword], grade: params[:grade_keyword], semester_id: params[:semester_keyword]).includes(:student, :user, :semester)
            @searchparameters = [params[:student_keyword], params[:grade_keyword], params[:semester_keyword]]
            student = Student.find(params[:student_keyword])
            @student = student.name
            semester = Semester.find(params[:semester_keyword])
            @semester = semester.semester
        else
            @aaa = 1
        end
        
        @students = Student.all
        @semesters = Semester.all
    end
    
    def new
        @result = Result.new
        @searchparameters = [params[:student_keyword], params[:grade_keyword], params[:semester_keyword]]
    end
    
    def create
        Result.create(create_params)
        redirect_to results_path
    end
    
    def edit
        @result = Result.find(params[:id])
    end
    
    def update
        result = Result.find(params[:id])
        result.update(update_params)
        redirect_to results_path
    end
    
    private
    def create_params
        params.require(:result).permit(:student_id, :grade, :semester_id, :english, :math, :japanese, :science, :social, :art, :pe, :techhome, :music, :total).merge(user_id: current_user.id)
    end
    
    def update_params
        params.require(:result).permit(:english, :math, :japanese, :science, :social, :art, :pe, :techhome, :music, :total).merge(user_id: current_user.id)
    end
end
