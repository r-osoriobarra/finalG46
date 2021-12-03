class UserCategoriesController < ApplicationController
  before_action :set_user_category, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
      @user_category = UserCategory.new
  end

  def edit
  end

  def create
      @user_category =  UserCategory.new(user_category_params)
      respond_to do |format|
          if @user_category.save
            format.html { redirect_to @user_category, notice: "Se ha creado la categoría exitosamente." }
          else
            format.html { render :new, status: :unprocessable_entity }       
          end
      end
  end

  def update
      respond_to do |format|
          if @user_category.update(user_category_params)
            format.html { redirect_to @user_category, notice: "La categoría se ha actualizado exitosamente." }
          else
            format.html { render :edit, status: :unprocessable_entity }
          end
      end
  end

  def destroy
      @user_category.destroy
      respond_to do |format|
        format.html { redirect_to root_path, notice: "La categoría se ha borrado." }
      end
  end    

  private

  def user_category_params
    params.require(:user_category).permit(:name)
  end

  def set_user_category
    @user_category = UserCategory.find(params[:id])
  end
end
