class Movie < ApplicationRecord

    validates :title, uniqueness: true, presence: true
    validates :description, presence: true
    validates :duration, presence: true
    validates :thumbnail, presence: true
    validates :release_date, presence: true
    validates :genre, presence: true
    validates :soundtrack, presence: true

    def self.ransackable_attributes(auth_object = nil)
		["title", "genre", "release_date"]
	end

end
