class IttoexamsController < ApplicationController
  def index
    require 'date'
    day = Time.zone.today
    year = day.year
    @thisyear = year
    @nextyear = year + 1
    @thismonth = day.month

    if params[:year_keyword].present? and params[:month_keyword].present?
      ittoexams = Ittoexam.where(year: params[:year_keyword]).includes(:student)
      @ittoexams = ittoexams.where(month: params[:month_keyword]).includes(:student, :user).order('students.classifying asc', 'students.grade asc', 'students.family_name_kana asc', 'students.given_name_kana asc')
      @searchparameters = [params[:year_keyword], params[:month_keyword]]
    else
      @ittoexams = Ittoexam.where(year: @thisyear, month: @thismonth).includes(:student, :user).order('students.classifying asc', 'students.grade asc', 'students.family_name_kana asc', 'students.given_name_kana asc')
      @searchparameters = [@thisyear, @thismonth]
    end

      # 各教科登録されていない生徒の割り出し
    @en_none_ittoexams = @ittoexams.where(english_score: nil).includes(:student)
    @ja_none_ittoexams = @ittoexams.where(japanese_score: nil).includes(:student)
    @sc_none_ittoexams = @ittoexams.where(science_score: nil).includes(:student)
    @so_none_ittoexams = @ittoexams.where(social_score: nil).includes(:student)
    
    # 提出されている人のid取り出し
    ittoexam_ids = []
    @ittoexams.each do |ittoexam|
      ittoexam_ids << ittoexam.student_id
    end
    # 小中学生全員のid取り出し
    student_ids = []
    students = Student.where(classifying: [1, 2])
    students.each do |student|
      student_ids << student.id
    end
    # 小中学生全員ー提出されている人＝未提出者のid
    ittoexam_ids.each do |ittoexam_id|
      @none_student_ids = student_ids.delete_if { |id| id == ittoexam_id }
    end
    @none_students = []
    # 未提出者のidがあれば、idから生徒を割り出し、順番を変えて取得
    if @none_student_ids.present?
      @none_student_ids.each do |none_student_id|
        @none_students << Student.find(none_student_id)
        @none_students = @none_students.sort { |a, b| [a[:classifying], a[:grade], a[:family_name_kana], a[:given_name_kana]] <=> [b[:classifying], b[:grade], b[:family_name_kana], b[:given_name_kana]] }
      end
    end
    # そもそも月に誰も登録されていないなら、@none_studentsに全員入れて渡す。
    if @ittoexams.blank?
      @student_ids = []
      students = Student.where(classifying: [1, 2])
      students.each do |student|
        @student_ids << student.id
      end
      @student_ids.each do |student_id|
        @none_students << Student.find(student_id)
        @none_students = @none_students.sort { |a, b| [a[:classifying], a[:grade], a[:family_name_kana], a[:given_name_kana]] <=> [b[:classifying], b[:grade], b[:family_name_kana], b[:given_name_kana]] }
      end
    end
  end

  def new
    @ittoexam = Ittoexam.new
    @searchparameters = [params[:year], params[:month], params[:student]]

    require 'date'
    day = Time.zone.today
    year = day.year
    @thisyear = year
    @nextyear = year + 1
    @lastyear = year - 1
    @thismonth = day.month
  end

  def create
    ittoexam = Ittoexam.where(year: params.require(:ittoexam)[:year], month: params.require(:ittoexam)[:month], student_id: params.require(:ittoexam)[:student_id])
    if ittoexam.blank?
      Ittoexam.create(create_params)
      redirect_to ittoexams_path
    end
  end

  def edit
    @ittoexam = Ittoexam.find(params[:id])

    require 'date'
    day = Time.zone.today
    year = day.year
    @thisyear = year
    @nextyear = year + 1
    @lastyear = year - 1
    @thismonth = day.month
  end

  def update
    ittoexam = Ittoexam.find(params[:id])
    ittoexam.update(update_params)
    redirect_to ittoexams_path
  end

  private

    def create_params
      params.require(:ittoexam).permit(:year, :month, :student_id, :english_score, :english_full_mark, :japanese_score, :japanese_full_mark, :science_score, :science_full_mark, :social_score, :social_full_mark).merge(user_id: current_user.id)
    end

    def update_params
      params.require(:ittoexam).permit(:year, :month, :student_id, :english_score, :english_full_mark, :japanese_score, :japanese_full_mark, :science_score, :science_full_mark, :social_score, :social_full_mark).merge(user_id: current_user.id)
    end
end
