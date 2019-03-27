class UsersController < ApplicationController
	before_action :authenticate_user!
	def show
		@user = User.find(current_user[:id])
	end
	def index
        @user = User.find(current_user[:id])
        @favorites = @user.favorites
        @search = Blog.ransack(params[:q])
        @products = @search.result
	end
	def edit
		@user = User.find(params[:id])
    end
    def update
	    @user = User.find(params[:id])
	    @user.update(user_params)
	    redirect_to users_path(@user.id)
	end

	def destroy
		blog = Blog.find(params[:id])
		blog.destroy
		redirect_to user_path
	end

	private
	def blog_params
		params.require(:blog).permit(:title, :location, :image)
	end

	def user_params
		params.require(:user).permit(:email, :name)
	end
end

