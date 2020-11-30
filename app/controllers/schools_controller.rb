class SchoolsController < ApplicationController
    def index
        @schools = School.all
        @school = School.new
    end
    
    def create
        School.create(school_params)
        redirect_to schools_path
    end
    
    private
    def school_params
        params.require(:school).permit(:classifying, :school)
    end
end
