class BlogsController < ApplicationController



def new
	@blog = Blog.new
end

def create
	blog = Blog.new(blog_params)
	blog.user_id = current_user.id
    blog.save
    redirect_to new_blog_content_path(blog.id)
end
def index
	@blogs = Blog.all
	@search = Blog.ransack(params[:q])
	@products = @search.result
end
def edit
	@blog = Blog.find(params[:id])
end
def update
	blog = Blog.find(params[:id])
	blog.update(blog_params)
	redirect_to user_path(blog.id)
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
