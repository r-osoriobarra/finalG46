class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
      @project = Project.new
  end

  def edit
  end

  def create
      @project =  Project.new(project_params)
      @project.user = current_user
      respond_to do |format|
          if @project.save
            format.html { redirect_to @project, notice: "Se ha creado el proyecto exitosamente." }
          else
            format.html { render :new, status: :unprocessable_entity }       
          end
      end
  end

  def update
      respond_to do |format|
          if @project.update(project_params)
            format.html { redirect_to @project, notice: "El proyecto se ha actualizado exitosamente." }
          else
            format.html { render :edit, status: :unprocessable_entity }
          end
      end
  end

  def destroy
      @project.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: "El proyecto se ha borrado." }
      end
  end    

  private

  def project_params
    params.require(:project).permit(:name, :description, :start_date, :industry, :website, :address)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
