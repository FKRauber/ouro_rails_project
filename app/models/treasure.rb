class Treasure < ApplicationRecord
	has_many :theories
	has_many :users, through: :theories

	belongs_to :creating_user, foreign_key: :user_id, optional: true

	validates :name, presence: true
	validates :name, uniqueness: true, on: :create
end
