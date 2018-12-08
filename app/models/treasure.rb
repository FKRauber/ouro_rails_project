class Treasure < ApplicationRecord
	has_many :theories
	has_many :users, through: :theories
	# belongs_to definition is required in Rails 5
	belongs_to :creating_user, foreign_key: :user_id, optional: true
end
