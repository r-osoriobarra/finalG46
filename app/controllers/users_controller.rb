class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
    @my_causes = User.my_causes(current_user)
    @my_approved_donations = current_user.donations.where(status: "approved")
    @donations_per_hour = @my_approved_donations.group_by_hour(:created_at).count
    @donations_per_cause = @my_approved_donations.group(:cause_id).count
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

  def entrepenaur
  end

  private
  def user_params
    params.require(:user).permit(:name, :surname, :username, :phone_number, :address)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
