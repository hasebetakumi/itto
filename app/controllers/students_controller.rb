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
    
    def edit
        @student = Student.find(params[:id])
    end
    
    def update
        student = Student.find(params[:id])
        student.update(update_params)
        redirect_to students_path
    end
    
    def show
        @student = Student.find(params[:id])
        @reports = Report.where(student_id: params[:id]).order(created_at: :DESC).includes(:student, :user, :subject, :classifying)
        @targets = Target.where(student_id: params[:id]).order(created_at: :DESC).includes(:student, :user)
        
        user_ids = Report.where(student_id: params[:id]).group(:user_id).order('count_user_id DESC').count(:user_id)
        @users = []
        @user_counts = []
        
            user_ids.each do |user_id|
                @users << User.find(user_id[0])
                @user_counts << user_id[1]
            end
        
        @results = Result.where(student_id: params[:id]).order(semester_id: :ASC, grade: :ASC).includes(:student, :user, :semester)
        @testresults = Testresult.where(student_id: params[:id]).order(test_id: :ASC, grade: :ASC).includes(:student, :user, :test)
        
        subjects = [{"ja" => "英語", "en" => :english}, {"ja" => "国語", "en" => :japanese}, {"ja" => "数学", "en" => :math}, {"ja" => "理科", "en" => :science}, {"ja" => "社会", "en" => :social}]
        
        # 成績グラフ用データ取得
        @result_data = []
        subjects.each do |subject|
            result_graph_data = {}
                result_graph_data[:name] = "#{subject["ja"]}"
                result_graph_data[:data] = {"1学期"=> 1 }
                    @results.each do |data|
                        label_semester = Semester.find(data[:semester_id])
                        semester = label_semester[:semester]
                        result_graph_data[:data].store("#{data[:grade]}年#{semester}", data[subject["en"]])
                    end
            result_graph_data[:data].delete("1学期")
        @result_data << result_graph_data
        end
        
        # 試験結果グラフ用データ取得
        @testresult_data = []
        subjects.each do |subject|
            result_graph_data = {}
                result_graph_data[:name] = "#{subject["ja"]}"
                result_graph_data[:data] = {"1学期"=> 1 }
                    @testresults.each do |data|
                        label_test = Test.find(data[:test_id])
                        test = label_test[:test]
                        result_graph_data[:data].store("#{data[:grade]}年#{test}", data[subject["en"]])
                    end
            result_graph_data[:data].delete("1学期")
        @testresult_data << result_graph_data
        end
            
    end
    
    private
    def student_params
        params.require(:student).permit(:classifying, :grade, :school_id, :year, :family_name, :given_name, :family_name_kana, :given_name_kana, :student_type_id)
    end
    
    def update_params
        params.require(:student).permit(:classifying, :grade, :school_id, :year, :family_name, :given_name, :family_name_kana, :given_name_kana, :student_type_id)
    end
end
