class IttoexamsController < ApplicationController
    def index
        if params[:year_keyword].present? and params[:month_keyword].present?
            ittoexams = Ittoexam.where(year: params[:year_keyword])
            @ittoexams = ittoexams.where(month: params[:month_keyword]).includes(:student, :user).order("students.family_name_kana desc", "students.grade asc", "students.classifying asc")
        else
            @ittoexams = []
        end
        
        require 'date'
        day = Date.today
        year = day.year
        @thisyear = year
        @nextyear = year + 1 
        @thismonth = day.month
    end
    
    def new
        @ittoexam = Ittoexam.new
        
        require 'date'
        day = Date.today
        year = day.year
        @thisyear = year
        @nextyear = year + 1 
        @lastyear = year - 1
        @thismonth = day.month
    end
    
    def create
        ittoexam = Ittoexam.where(year: params.require(:ittoexam)[:year], month: params.require(:ittoexam)[:month], student_id: params.require(:ittoexam)[:student_id])
        if ittoexam.present?
            
        else
            Ittoexam.create(create_params)
            redirect_to ittoexams_path
        end
    end
    
    def edit
        @ittoexam = Ittoexam.find(params[:id])
        
        require 'date'
        day = Date.today
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
