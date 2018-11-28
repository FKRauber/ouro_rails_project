class User < ActiveRecord::Base
	has_secure_password

	has_many :theories
	has_many :created_treasure
	has_many :treasures, through: :theories
end
