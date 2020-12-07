class ReportsController < ApplicationController
    def index
        if params[:keyword]
            @reports = Report.where(user_id: params[:keyword]).order(created_at: :DESC)
        else
            @reports = Report.all.order(created_at: :DESC)
        end
        @users = User.all
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