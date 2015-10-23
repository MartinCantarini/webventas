class Userlikearticle < ActiveRecord::Base
	def self.haslike(article_id,user_id)
		Userlikearticle.all.each do |ula|
			if(ula.user_id==user_id && ula.article_id==article_id)
				return "si"
			end		
		end
		return "no"
	end	
end
