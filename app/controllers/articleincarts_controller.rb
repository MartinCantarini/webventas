class ArticleincartsController < ApplicationController
  def new
    @articleincart=Articleincart.new;
    @articleincart.id_article=params[:format].to_i
    Cart.all.each do |c|
      if c.user_id==current_user.id
        @idofcart=c.id
      end
    end
    @articleincart.id_cart=@idofcart.to_s
    if @articleincart.save
      flash[:notice]="Producto agregado a mi carrito"
      redirect_to :root
    else
      flash[:alert]="No se pudo completar la acción, intente nuevamente en unos segundos"
      redirect_to :root
    end    
  end

  def create
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
    @articleincart=Articleincart.find_by(id_cart: params[:id_cart], id_article: params[:id_article])
    @articleincart.destroy;
    if @articleincart.save
      flash[:notice] = "Producto eliminado correctamente del carrito"
      redirect_to :root
    else
      flash.now[:error] = "No se puedo actualizar la información del carrito, intente nuevamente en unos segundos"
      redirect_to :root
    end
  end
end
