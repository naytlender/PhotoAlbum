class Photo < ActiveRecord::Base
	belongs_to :album
	has_and_belongs_to_many :tags

	validates :name, presence: true
	validates :data, presence: true

end