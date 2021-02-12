class TargetsController < ApplicationController
  def new
    @target = Target.new
    @targets = Target.all.includes(:student, :user).order(created_at: :DESC)
  end

  def create
    Target.create(create_params)
    redirect_to new_target_path
  end

  def destroy
    target = Target.find(params[:id])
    if target.user_id == current_user.id
      target.destroy
    end
    redirect_to student_path(target.student_id)
  end

  private

    def create_params
      params.require(:target).permit(:student_id, :exam_coverage_first, :exam_coverage_last, :score, :full_mark).merge(user_id: current_user.id)
    end
end
