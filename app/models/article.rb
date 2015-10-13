class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates :name, presence: true
	validates :price, presence: true
	validates :description, presence: true
	validates :ubicacion, presence: true
	validates :foto, presence: true
	validates :category_id, presence: true

	def self.search(search)
  		where("name LIKE ?", "%#{search}%") 
	end
end
