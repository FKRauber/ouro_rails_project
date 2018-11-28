class User < ActiveRecord::Base
	has_secure_password

	has_many :treasures
	has_many :theories
end
