class StudentsController < ApplicationController
    def index
        @elementary_students = Student.where(classifying: 1).includes(:school, :student_type).order(grade: :ASC, family_name_kana: :ASC)
        @junior_high_school_students = Student.where(classifying: 2).includes(:school, :student_type).order(grade: :ASC, family_name_kana: :ASC)
        @high_school_students = Student.where(classifying: 3).includes(:school, :student_type).order(grade: :ASC, family_name_kana: :ASC)
        @student = Student.new
    end
    
    def create
        Student.create(student_params)
        @elementary_students = Student.where(classifying: 1).includes(:school, :student_type).order(grade: :ASC, family_name_kana: :ASC)
        @junior_high_school_students = Student.where(classifying: 2).includes(:school, :student_type).order(grade: :ASC, family_name_kana: :ASC)
        @high_school_students = Student.where(classifying: 3).includes(:school, :student_type).order(grade: :ASC, family_name_kana: :ASC)
    end
    
    def show
        @student = Student.find(params[:id])
        @reports = Report.where(student_id: params[:id]).order(created_at: :DESC)
        
        user_ids = Report.where(student_id: params[:id]).group(:user_id).order('count_user_id DESC').count(:user_id)
        @users = []
        @user_counts = []
        
            user_ids.each do |user_id|
                @users << User.find(user_id[0])
                @user_counts << user_id[1]
            end
        
        @results = Result.where(student_id: params[:id]).order(created_at: :DESC)
        @testresults = Testresult.where(student_id: params[:id]).order(created_at: :DESC)
    end
    
    private
    def student_params
        params.require(:student).permit(:classifying, :grade, :school_id, :year, :family_name, :given_name, :family_name_kana, :given_name_kana, :student_type_id)
    end
end
