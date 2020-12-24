class ReportsController < ApplicationController
    def index
        if params[:user_keyword].present? and params[:student_keyword].present?
            reports = Report.where(user_id: params[:user_keyword]).order(created_at: :DESC).includes(:student, :user, :subject, :classifying).page(params[:page]).per(5)
            @reports = reports.where(student_id: params[:student_keyword]).order(created_at: :DESC).includes(:student, :user, :subject, :classifying).page(params[:page]).per(5)
        elsif params[:user_keyword].present? and params[:student_keyword].blank?
            @reports = Report.where(user_id: params[:user_keyword]).order(created_at: :DESC).includes(:student, :user, :subject, :classifying).page(params[:page]).per(5)
        elsif params[:user_keyword].blank? and params[:student_keyword].present?
            @reports = Report.where(student_id: params[:student_keyword]).order(created_at: :DESC).includes(:student, :user, :subject, :classifying).page(params[:page]).per(5)
        else    
            @reports = Report.all.order(created_at: :DESC).includes(:student, :user, :subject, :classifying).page(params[:page]).per(5)
        end
        
        @users = User.all
        @students = Student.all
    end
    
    def new
        @report = Report.new
        if params[:student].present? and params[:classifying].present? and params[:subject]
            @parameters = [params[:student], params[:classifying], params[:subject]]
        end
    end
    
    def create
        Report.create(create_params)
        redirect_to reports_path
    end
    
    private
    def create_params
        params.require(:report).permit(:classifying_id, :student_id, :subject_id, :report, :understanding).merge(user_id: current_user.id)
    end
end