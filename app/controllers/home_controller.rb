class HomeController < ApplicationController
    skip_before_action :authenticate_user!
    
    def index   
        @user = User.new
        @causes = Cause.eager_load(
            :project, 
            :report, 
            :cause_points,
            :comments
        )
    end
end