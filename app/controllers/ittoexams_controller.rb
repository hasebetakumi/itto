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
end
