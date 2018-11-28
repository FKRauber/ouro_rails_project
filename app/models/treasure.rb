class Treasure < ApplicationRecord
	has_many :theories
	has_many :users, through: :theories
	belongs_to :creating_user
end
