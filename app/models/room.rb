class Room < ApplicationRecord


	scope :most_recent, -> { order('created_at DESC') }

	has_many :reviews, dependent: :destroy
	belongs_to :user

	def complete_name
	"#{title}, #{location}"
	end
end
