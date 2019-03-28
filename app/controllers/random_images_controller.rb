class RandomImagesController < ApplicationController
	before_action :authenticate_user!
	before_action :only_admin_user
def new
	@random = RandomImage.new
end
def create
	random = RandomImage.new(random_image_params)
    random.save
    redirect_to new_random_image_path
end
def only_admin_user
    if current_user.admin?
    else
      redirect_to root_path
    end
  end
private
  def random_image_params
    params.require(:random_image).permit(:image)
  end
end
