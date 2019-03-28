class AdminsController < ApplicationController
  before_action :only_admin_user

  def index
  	@users = User.all
  end
  def destroy
	  user = User.find(params[:id])
    user.destroy
    redirect_to admins_path
  end
  def blog
    @blogs = Blog.all
  end
  def cut
    blog = Blog.find(params[:blog_id])
    blog.destroy
    redirect_to admin_blogs_path
  end
  def only_admin_user
    if current_user.admin?
    else
      redirect_to root_path
    end
  end

  private
  def admin_params
  	params.require(:user).permit(:name, :email,)
  end
end

