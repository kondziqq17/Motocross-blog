class User < ApplicationRecord
	acts_as_voter
	has_many :posts
	has_many :comments

	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
