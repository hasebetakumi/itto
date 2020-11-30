class SchoolsController < ApplicationController
    def index
        @schools = School.all
        @school = School.new
    end
    
    def create
        School.create(school_params)
    end
    
    private
    def school_params
        params.require(:school).permit(:classifying, :school)
    end
end
