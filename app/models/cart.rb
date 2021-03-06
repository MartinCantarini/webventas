class Cart < ActiveRecord::Base
	belongs_to :user
	has_many :articlesincart, dependent: :destroy
	def paypal_url(return_url)
	  values = {
	    :business => 'argenshopping3@gmail.com',
	    :cmd => '_cart',
	    :upload => 1,
	    :return => return_url,
	    :invoice => id
	  }
	  articleincart = Articleincart.where(id_cart: id)
	  articleincart.each_with_index do |item, index|
	    article=Article.find(item.id_article)
	    if article.category_id==9 or article.category_id==9 
	    	article.price=(article.price.to_i)-(article.price.to_i*0.25)
	    end	
	    values.merge!({
	      "amount_#{index+1}" => article.price,
	      "item_name_#{index+1}" => article.name,
	      "item_number_#{index+1}" => article.id,
	      "quantity_#{index+1}" => 1
	    })
	  end
	  
	  "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
	end
end
