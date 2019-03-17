class ContentsController < ApplicationController
	def new
		@content = Content.new
		@blog_id = params[:id]
	end
	def create
		content =Content.new(content_params)
		content.blog_id = params[:blog_id]
		content.save
		if params["a"]
			redirect_to new_blog_content_path
	    else
			redirect_to root_path
	    end
	end
	def index
		@content = Content.where(blog_id: params[:blog_id])
	end

	private
    def content_params
        params.require(:content).permit(:content_title, :url, :image, :body, :blog_id)
    end
end

