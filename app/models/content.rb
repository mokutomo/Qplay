class Content < ApplicationRecord
	belongs_to :blog
	attachment :image
	validates :body,
    length: { maximum: 160 },presence: true
    validates :content_title,
    length: { maximum: 14 },presence: true
end
