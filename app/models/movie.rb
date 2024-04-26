class Movie < ApplicationRecord
	has_many :shows
	 has_many :bookings, through: :shows

	has_one_attached :image
	extend FriendlyId
  	friendly_id :name, use: :slugged
end
