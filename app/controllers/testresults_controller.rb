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
        
        @students = Student.where(classifying: 2).order(classifying: :ASC, grade: :ASC, family_name_kana: :ASC)
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
        @testresult = Testresult.find(params[:id])
    end
    
    def update
        testresult = Testresult.find(params[:id])
        testresult.update(update_params)
        redirect_to testresults_path
    end
    
    def alltestresult
        if params[:grade_keyword].present? and params[:test_keyword].present?
            @testresults = Testresult.where(grade: params[:grade_keyword]).includes(:user, :student, :test)
            @testresults = @testresults.where(test_id: params[:test_keyword]).includes(:user, :student, :test).order('students.classifying asc', 'students.grade asc', 'students.family_name_kana asc')
        elsif params[:grade_keyword].present? and params[:test_keyword].blank?
            @testresults = Testresult.where(grade: params[:grade_keyword]).includes(:user, :student, :test).order('students.classifying asc', 'students.grade asc', 'students.family_name_kana asc')
        elsif params[:grade_keyword].blank? and params[:test_keyword].present?
             @testresults = Testresult.where(test_id: params[:test_keyword]).includes(:user, :student, :test).order('students.classifying asc', 'students.grade asc', 'students.family_name_kana asc')
        else
            @testresults = Testresult.all.includes(:student, :user, :test).order('students.classifying asc', 'students.grade asc', 'students.family_name_kana asc')
        end
        
        @tests = Test.all
    end
    
    private
    def create_params
        params.require(:testresult).permit(:student_id, :grade, :test_id, :english, :math, :japanese, :science, :social, :art, :pe, :techhome, :music, :fivetotal, :classrank, :graderank).merge(user_id: current_user.id)
    end
    
    def update_params
        params.require(:testresult).permit(:english, :math, :japanese, :science, :social, :art, :pe, :techhome, :music, :fivetotal, :classrank, :graderank).merge(user_id: current_user.id)
    end
end
