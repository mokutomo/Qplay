class ContentsController < ApplicationController
	def new
		@content = Content.new
		@blog_id = params[:id]
	end
	def create
		content =Content.new(content_params)
		content.save
		redirect_to new_content_path
	end
	def index
		@content = Content.where(blog_id: params[:blog_id])
	end

	private
    def content_params
        params.require(:content).permit(:content_title, :url, :image, :body, :blog_id)
    end
end

