Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :blogs do
resources :contents
end
resources :users
resources :random_images


root :to => 'blogs#index'


end
