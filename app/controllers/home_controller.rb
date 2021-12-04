class HomeController < ApplicationController
    skip_before_action :authenticate_user!
    
    def index   
        @causes = Cause.eager_load(
            :project, 
            :report, 
            :cause_points, 
            :points, 
            :comments
        )    
    end
end