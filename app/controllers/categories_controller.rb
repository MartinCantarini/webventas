class CategoriesController < ApplicationController
  def new
    @category=Category.new;
  end

  def create
    @category=Category.new(params_category);
    if @category.save
      redirect_to categories_path
    else
      flash.now[:error] = "No se puedo crear una nueva categoria, intente nuevamente en unos segundos"
      redirect_to categories_path
     end 
  end

  def edit
  end

  def update
  end

  def show
    @category=Category.find(params[:id]);
  end

  def index
    @categories=Category.all;

  end

  def delete
  end
  def params_category
    params.require(:category).permit([:name]);
  end
end
