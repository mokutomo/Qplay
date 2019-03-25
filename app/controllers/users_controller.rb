class UsersController < ApplicationController
	def show
		@user = User.find(current_user[:id])
	end
	def index
        @user = User.find(current_user[:id])
        @favorites = @user.favorites
        @search = Blog.ransack(params[:q])
        @products = @search.result
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
end

