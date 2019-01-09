class User < ApplicationRecord
	has_secure_password

	has_many :theories
	has_many :created_treasure
	has_many :treasures, through: :theories

	validates :username, presence: true
	validates :username, uniqueness: true, on: :create

	def self.find_or_create_with_omniauth(auth)
		create! do |user|
			user.username = auth["username"]
			user.email = auth["email"]
			user.password = auth["uid"]
		end
	end
end
