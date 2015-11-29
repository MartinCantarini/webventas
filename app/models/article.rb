class Article < ActiveRecord::Base
	#dependencias
	belongs_to :user
	has_many :comments, dependent: :destroy

	validates :name, presence: true
	validates :price, presence: true
	validates :description, presence: true
	validates :ubicacion, presence: true
	validates :category_id, presence: true

	include PgSearch
  pg_search_scope :search, against: [:name, :price,:ubicacion,:description],
    using: {tsearch: {dictionary: "english"}},
    ignoring: :accents

  def self.text_search(query)
    if query.present?
      # search(query)
      rank = <<-RANK
        ts_rank(to_tsvector(name), plainto_tsquery(#{sanitize(query)}))
      RANK
      where("to_tsvector('english', name) @@ :q or to_tsvector('english', price) @@ :q or to_tsvector('english', ubicacion) @@ :q or to_tsvector('english', description) @@ :q", q: query).order("#{rank} desc")
    else
      scoped
    end
  end
	#def self.search(search)
  	#	where("name @@ :q or price @@ :q or ubicacion @@ :q or description @@ :q", q: search) 
	#end

	#attr_accessible :foto

	mount_uploader :foto, FotoUploader

	def self.cant_likes(id_article)
		articulo=find(id_article)
		return articulo.likes
	end 	
end
