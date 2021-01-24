class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reports = Report.where(user_id: params[:id]).order(created_at: :DESC).includes(:student, :user, :subject, :classifying)
    @targets = Target.where(user_id: params[:id]).order(created_at: :DESC).includes(:student, :user)
    @ittoexams = Ittoexam.where(user_id: params[:id]).order(created_at: :DESC).includes(:student, :user)

    user_student_ids = Report.where(user_id: params[:id]).group(:student_id).order('count_student_id DESC').count(:student_id)
    @students = []
    @student_counts = []

    user_student_ids.each do |student_id|
      @students << Student.find(student_id[0])
      @student_counts << student_id[1]
    end

    @results = Result.where(user_id: params[:id]).order(created_at: :DESC).includes(:student, :user, :semester)
    @testresults = Testresult.where(user_id: params[:id]).order(created_at: :DESC).includes(:student, :user, :test)
  end

  def index
    @users = User.all
  end
end
