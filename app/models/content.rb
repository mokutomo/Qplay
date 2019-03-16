class Content < ApplicationRecord
	belongs_to :blog
	attachment :image
end
