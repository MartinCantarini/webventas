class CartsController < ApplicationController
  def new

      @cart=Cart.new;
   
  end

  def create
  end

  def index
  end

  def show 
    Cart.all.each do |cart|
      if cart.user_id==current_user.id
        @cart=cart
      end  
    end
    respond_to do |format|
      format.html
      format.pdf do 
        pdf = OrderPdf.new
        pdf.header_afip(@cart.id)
        send_data pdf.render , filename: "Comprobante_afip_#{current_user.name}-#{current_user.lastname}-#{Time.now}.pdf"
                              
      
      end
    end     
  end

  def edit
  end

  def update
  end

  def destroy
    @cart=Cart.find(params[:id])
    @cart.destroy;
  end

  def home
    if user_signed_in?
    x="no"
    Cart.all.each do |carritos|
    if carritos.id==current_user.id
      x="si";
    end
    end
    if x == "no"
      @cart=Cart.new;
      @cart.user_id=current_user.id;
      @cart.save
    end
    end
  end 

  def sale_successful
  Cart.all.each do |cart|
      if cart.user_id==current_user.id
        @cart=cart
      end  
  end
  @cartfinal=@cart.id
  @cart.state="exitosa"
  @cart.created_at=Time.now
  @cart.save
  @cart=Cart.new;
  @cart.user_id=current_user.id;

  if @cart.save
    flash[:notice]="Venta realizada con exito"
  else
    flash[:alert]="Error, por favor contactese con nosotros"
  end  
  
end


def miscompras
  @miscompras=Cart.where(state: "exitosa");
end 

end
