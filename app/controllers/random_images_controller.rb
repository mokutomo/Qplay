class RandomImagesController < ApplicationController
def new
	@random = RandomImage.new
end
def create
	random = RandomImage.new(random_image_params)
    random.save
    redirect_to new_random_image_path
end
private
  def random_image_params
    params.require(:random_image).permit(:image)
  end
end
