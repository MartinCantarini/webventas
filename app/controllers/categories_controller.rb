class CategoriesController < ApplicationController
  def new
    @category=Category.new(params_category)
  end

  def create
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
