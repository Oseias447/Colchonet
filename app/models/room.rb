class Room < ApplicationRecord
	

	scope :most_recent, -> { order('created_at DESC') }

	has_many :reviews, dependent: :destroy
	belongs_to :user

	mount_uploader :picture, PictureUploader

	def complete_name
	"#{title}, #{location}"
	end


	def self.search(query)
		if query.present?
			where(['location LIKE :query OR
				title LIKE :query OR
					description LIKE :query', query: "%#{query}%"])
		else
		all
	  end
	end

end
