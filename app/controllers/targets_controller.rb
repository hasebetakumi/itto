class TargetsController < ApplicationController
    def new
        @target = Target.new
    end
end
