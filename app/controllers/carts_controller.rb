class CartsController < ApplicationController
  def new
    x=0;
    Cart.all.each do |carritos|
    if carritos.id=current_user.id
      x=1;
    end
    end
    if x == 1
      @cart=Cart.new;
      @cart.user_id=current_user.id;
      @cart.save
      x=0;
    end
    redirect_to carts_show_path    
  end

  def create
  end

  def index
  end

  def show
    Cart.all.each do |c|
      if c.user_id==current_user.id
        @cartid=c.id
      end
    end  
    @cart=Cart.find(@cartid);

  end

  def edit
  end

  def update
  end

  def destroy
    @cart=Cart.find(params[:id])
    @cart.destroy;
  end

end
