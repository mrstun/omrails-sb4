class Sighting < ApplicationRecord
	belongs_to :user
	geocoded_by :address   # can also be an IP address
	after_validation :geocode          # auto-fetch coordinates
	validates :user, presence: true
	validates :content, presence: true
end
