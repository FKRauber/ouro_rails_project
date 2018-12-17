class User < ApplicationRecord
	has_secure_password

	has_many :theories
	has_many :created_treasure
	has_many :treasures, through: :theories

	validates :username, presence: true
	validates :username, uniqueness: true, on: :create

	def self.create_with_omniauth(auth)
		create! do |user|
			user.provider = auth["provider"]
			user.uid = auth ["uid"]
			user.name = auth["info"]["name"]
		end
	end
end
