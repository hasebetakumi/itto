class TestresultsController < ApplicationController
    def index
        if params[:student_keyword].present? and params[:grade_keyword].present? and params[:test_keyword].present?
            @testresults = Testresult.where(student_id: params[:student_keyword], grade: params[:grade_keyword], test_id: params[:test_keyword]).includes(:student, :user, :test)
            @searchparameters = [params[:student_keyword], params[:grade_keyword], params[:test_keyword]]
            student = Student.find(params[:student_keyword])
            @student = student.name
            test = Test.find(params[:test_keyword])
            @test = test.test
        else
            @aaa = 1
        end
        
        @students = Student.all
        @tests = Test.all
    end
    
    def new
        @testresult = Testresult.new
        @searchparameters = [params[:student_keyword], params[:grade_keyword], params[:test_keyword]]
    end

    def create
        Testresult.create(create_params)
        redirect_to testresults_path
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    private
    def create_params
        params.require(:testresult).permit(:student_id, :grade, :test_id, :english, :math, :japanese, :science, :social, :art, :pe, :techhome, :music, :fivetotal, :classrank, :graderank).merge(user_id: current_user.id)
    end
    
    def update_params
        
    end
end
