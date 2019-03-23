Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :users
resources :random_images

resources :blogs do
resource :favorites, only: [:create, :destroy]
resources :contents
end



root :to => 'blogs#index'


end
