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
end


private
    def blog_params
        params.require(:blog).permit(:title, :location, :image)
end
end
