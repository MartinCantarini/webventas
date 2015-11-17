class Article < ActiveRecord::Base
	#dependencias
	belongs_to :user
	has_many :comments, dependent: :destroy

	validates :name, presence: true
	validates :price, presence: true
	validates :description, presence: true
	validates :ubicacion, presence: true
	validates :category_id, presence: true

	def self.search(search)
  		where("name LIKE ? or ubicacion LIKE ? ","%#{search}%","%#{search}%") 
	end

	#attr_accessible :foto

	mount_uploader :foto, FotoUploader

	def self.cant_likes(id_article)
		articulo=find(id_article)
		return articulo.likes
	end 	
end
