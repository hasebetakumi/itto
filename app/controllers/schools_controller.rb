class SchoolsController < ApplicationController
    def index
        @schools = School.all
        @school = School.new
    end
end
