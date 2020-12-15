class TestresultsController < ApplicationController
    def index
        if params[:student_keyword].present? and params[:grade_keyword].present? and params[:test_keyword].present?
            @results = Result.where(student_id: params[:student_keyword], grade: params[:grade_keyword], semester_id: params[:test_keyword]).includes(:student, :user, :test)
            @searchparameters = [params[:student_keyword], params[:grade_keyword], params[:test_keyword]]
            student = Student.find(params[:student_keyword])
            @student = student.name
            test = Test.find(params[:test_keyword])
            @semester = test.test
        else
            @aaa = 1
        end
        
        @students = Student.all
        @tests = .all
    end
    
    def new
        
    end

    def create
        
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    private
    def create_params
        
    end
    
    def update_params
        
    end
end
