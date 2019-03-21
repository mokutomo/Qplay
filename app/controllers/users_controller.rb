class UsersController < ApplicationController
	def show
		@user = User.find(current_user[:id])
	end
	def index
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

