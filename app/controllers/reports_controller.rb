class ReportsController < ApplicationController
    def index
        if params[:user_keyword].present? and params[:student_keyword].present?
            reports = Report.where(user_id: params[:user_keyword]).order(created_at: :DESC)
            @reports = reports.where(student_id: params[:student_keyword]).order(created_at: :DESC)
        elsif params[:user_keyword].present? and params[:student_keyword].blank?
            @reports = Report.where(user_id: params[:user_keyword]).order(created_at: :DESC)
        elsif params[:user_keyword].blank? and params[:student_keyword].present?
            @reports = Report.where(student_id: params[:student_keyword]).order(created_at: :DESC)
        else    
            @reports = Report.all.order(created_at: :DESC)
        end
        
        @users = User.all
        @students = Student.all
    end
    
    def new
        @report = Report.new
    end
    
    def create
        Report.create(create_params)
        redirect_to reports_path
    end
    
    private
    def create_params
        params.require(:report).permit(:classifying_id, :student_id, :subject_id, :report).merge(user_id: current_user.id)
    end
end