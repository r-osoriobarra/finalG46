class CausesController < ApplicationController
    before_action :set_cause, only: [:show, :edit, :update, :destroy, :publication]
    
    def publication
        @comment = Comment.new
    end
    
    def index
        @causes = Cause.all   
    end

    def show
    end

    def new
        @cause = Cause.new
        @projects = current_user.projects
    end

    def edit
        @project = @cause.project.name
    end

    def create
        @cause =  Cause.new(cause_params)
        respond_to do |format|
            if @cause.save

                CausePoint.create_point_stock(@cause)
                format.html { redirect_to @cause, notice: "Tu causa se ha creado exitosamente." }
            else
                format.html { render :new, status: :unprocessable_entity }       
            end
        end
    end

    def update
        respond_to do |format|
            if @cause.update(cause_params)
                
                CausePoint.update_point_stock(@cause)
                format.html { redirect_to @cause, notice: "La causa se ha actualizado exitosamente." }
            else
                format.html { render :edit, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @cause.destroy
        respond_to do |format|
            format.html { redirect_to root_path, notice: "La causa se ha borrado." }
        end
    end 
    
    private

    def cause_params
        params.require(:cause).permit(:title, :story, :start_date, :end_date, :goal, :reward, :project_id)
    end

    def set_cause
        @cause = Cause.find(params[:id])
    end
end
