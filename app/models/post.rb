class Post < ApplicationRecord
	validates :title, presence: true, length: { maximum: 30 }
	validates :description, presence: true, length: { minimum: 5 }
	belongs_to :user
end
