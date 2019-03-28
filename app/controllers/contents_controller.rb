class ContentsController < ApplicationController
	before_action :authenticate_user!
	def new
		@content = Content.new
		@blog_id = params[:id]
	end
	def create
		content =Content.new(content_params)
		content.blog_id = params[:blog_id]
		if content.save
		if params["a"]
			redirect_to new_blog_content_path
		else
			redirect_to root_path
		end
	    else
	    	@content = Content.new
		@blog_id = params[:id]
		render action: :new
	end
	end
	def index
		@blog = Blog.find(params[:blog_id])
		@user = @blog.user_id
		@content = Content.where(blog_id: params[:blog_id])
	end
	def edit
		@blog = Blog.find(params[:blog_id])
		@content = Content.find(params[:id])
	end
	def update
		content = Content.find(params[:id])
		if content.update(content_params)
		redirect_to blog_contents_path
	else
		@blog = Blog.find(params[:blog_id])
		@content = Content.find(params[:id])
		render action: :edit
	end
	end
	def destroy
		content = Content.find(params[:id])
		content.destroy
		redirect_to blog_contents_path
	end

	private
	def content_params
		params.require(:content).permit(:content_title, :url, :image, :body, :blog_id)
	end
end

