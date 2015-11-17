class OrderPdf < Prawn::Document
	def initialize
		super
		image open "http://www.maquinac.com/wp-content/uploads/2013/01/AFIP_logo1.jpg"
		text "Formulario de venta electrónica - AFIP", size: 25, style: :bold
	end
	
	def header_afip(p1)
		
		move_down 20
		nro_article=0
		total=0
		Articleincart.all.each do |ac|
			if ac.id_cart==p1	
				nro_article=nro_article+1;
				a=Article.find(ac.id_article)
				text "Artículo número #{nro_article}",size: 15,style: :italic
				move_down 10
				text"Nombre:#{a.name}",size: 10
				text"Cantidad:1",size: 10
				text"Precio unitario: $#{a.price}",size: 10
				total=total+a.price.to_i
				move_down 20
			end	
		end
		move_down 30
		text "Total a pagar: $#{total}",size: 15,style: :italic
	end	

end