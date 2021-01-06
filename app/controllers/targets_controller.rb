class TargetsController < ApplicationController
    def new
        @target = Target.new
    end
    
    def create
        Target.create(create_params)
        redirect_to student_path(params.require(:target)[:student_id])
    end
    
    private
    def create_params
        params.require(:target).permit(:student_id, :exam_coverage_first, :exam_coverage_last, :score, :full_mark).merge(user_id: current_user.id)
    end
end
