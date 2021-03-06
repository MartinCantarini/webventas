class Article < ActiveRecord::Base
	#dependencias
	include PgSearch
	belongs_to :user
	has_many :comments, dependent: :destroy

	validates :name, presence: true
	validates :price, presence: true
	validates :description, presence: true
	validates :ubicacion, presence: true
	validates :category_id, presence: true

	pg_search_scope :search, :against => [:name,:ubicacion,:price,:description],
				  :using => {
                    :tsearch => {:any_word => true}
                  }
	
	
	#def self.search(query)
  	#	where("name @@ :q or price @@ :q or ubicacion @@ :q or description @@ :q", q: query) 
	#end

	#attr_accessible :foto

	mount_uploader :foto, FotoUploader

	def self.cant_likes(id_article)
		articulo=find(id_article)
		return articulo.likes
	end 	
end
