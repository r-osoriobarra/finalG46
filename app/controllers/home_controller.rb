class HomeController < ApplicationController
    skip_before_action :authenticate_user!
    
    def index   
        @user = User.new
        @causes = Cause.eager_load(
            :project, 
            :report, 
            :comments
        ).order(created_at: :desc)
    end
end