class SchoolsController < ApplicationController
    def index
        @schools = School.all.order(classifying: :ASC)
        @school = School.new
    end
    
    def create
        School.create(school_params)
        @schools = School.all.order(classifying: :ASC)
    end
    
    private
    def school_params
        params.require(:school).permit(:classifying, :school)
    end
end
