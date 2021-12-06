class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end
    
    def create
        @comment = Comment.new(comment_params)
        @comment.user = current_user
        @comment.cause = Cause.find(params[:cause_id])

        respond_to do |format|
            if @comment.save!
                format.html { redirect_to root_path}
            else
                format.html { redirect_to publication_path(@cause.id), status: :unprocessable_entity }       
            end
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:comment)
    end
end
