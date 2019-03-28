Rails.application.routes.draw do
devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :admins
resources :random_images

resources :blogs do
resource :favorites, only: [:create, :destroy]
resources :contents
end
get "admin/blogs" => "admins#blog"
delete "admin/blog/:blog_id" => "admins#cut",as:"blog_destroy"
delete '/blog/:blog_id/favorites/mypage' => 'favorites#destroy_mypage',as: 'favorites_destroy_mypage'

root :to => 'blogs#index'


end
