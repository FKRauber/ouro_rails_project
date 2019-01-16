class User < ApplicationRecord
	has_secure_password

	has_many :theories
	has_many :created_treasure
	has_many :treasures, through: :theories

	validates :username || :email, presence: true
	validates :username, uniqueness: true, on: :create

	def self.find_or_create_with_oa(uid: auth['uid']) do |u|
			u.uid = auth["uid"]
			u.username = auth["username"]
			u.email = auth["email"]
			u.password = auth["uid"]
		end
	end
end
