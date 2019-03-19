class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end











	private
    def blog_params
        params.require(:blog).permit(:title, :location, :image)
    end
end

