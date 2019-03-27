class AdminsController < ApplicationController
  def show
  	@user = User.find(params[:id])
  end
  def index
  	@users = User.all
  end
  def destroy
	user = User.find(params[:id])
    user.destroy
    redirect_to admins_path
  end

  private
  def admin_params
  	params.require(:user).permit(:name, :email,)
  end
end
