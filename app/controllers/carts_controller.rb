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

end
