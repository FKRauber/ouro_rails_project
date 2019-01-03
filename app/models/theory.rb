class Theory < ApplicationRecord
	belongs_to :user, foreign_key: :user_id, optional: true
	belongs_to :treasure

	validates :name, presence: true
	validates :name, uniqueness: true, on: :create

	scope :success, -> {where(success: true)}

	def self.success_theory
		
	end
end
