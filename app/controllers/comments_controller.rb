class CommentsController < ApplicationController
    before_action :set_cause, only: [:create]
    def new
        @comment = Comment.new
        @username = current_user.username
    end
    
    def create
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        @comment.cause = @cause

        respond_to do |format|
            if @comment.save!
                format.html { redirect_to publication_path(@cause)}
            else
                format.html { redirect_to publication_path(@cause), status: :unprocessable_entity }       
            end
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:comment)
    end

    def set_cause
        @cause =  Cause.find(params[:cause_id])
    end
end
