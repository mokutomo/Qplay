class FavoritesController < ApplicationController
  def create
  	        blog = Blog.find(params[:blog_id])
            favorite = current_user.favorites.new(blog_id: blog.id)
            favorite.save
            redirect_to root_path(blog)
  end
  def destroy
  	        blog = Blog.find(params[:blog_id])
            favorite = current_user.favorites.find_by(blog_id: blog.id)
            favorite.destroy
            redirect_to root_path(blog)
  end

  def destroy_mypage
            blog = Blog.find(params[:blog_id])
            favorite = current_user.favorites.find_by(blog_id: blog.id)
            favorite.destroy
            redirect_to users_path
  end
end
