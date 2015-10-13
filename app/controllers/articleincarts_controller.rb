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
    @articleincart.save
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
  end
end
