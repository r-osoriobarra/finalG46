class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
  end

  def edit
  end

  def update
    respond_to do |format|
        if @user.update(user_params)
            format.js { render nothing: true, notice: 'Tus datos han sido actualizados.' }
        else
            format.html { redirect_to edit_profile_path(@user.id), notice: 'No se han podido actualizar tus datos.' }
        end
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :surname, :phone_number, :address)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
