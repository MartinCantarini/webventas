class ArticlesController < ApplicationController

  def new
    @article=Article.new;
  end

  def create
    @article=Article.new(params_article)
    if @article.save
      redirect_to my_articles_path(current_user.id)
    else
      flash.now[:error] = "No se puedo publicar un nuevo artículo, intente nuevamente en unos segundos"
      render action: "new"  
     end 
  end

  def index
      if params[:search]
        @articles = Article.search(params[:search])
      else
        @articles = Article.all
      end
  end


  def show
    @article=Article.find(params[:id])
  end

  def edit
    @article=Article.find(params[:id])
  end

  def update
    @article=Article.find(params[:id])
    @article.update(params_article)
    if @article.save
      redirect_to articles_path
    else
      flash.now[:error] = "No se puedo actualizar la información del artículo, intente nuevamente en unos segundos"
      render action: "edit"  
     end

  end

  def delete
    @article=Article.find(params[:id])
    @article.destroy
    if @article.save
      flash[:notice] = "Producto eliminado correctamente"
      redirect_to articles_path
    else
      flash.now[:error] = "No se puedo actualizar la información del artículo, intente nuevamente en unos segundos"
      render action: "index"  
     end
  end

  def misarticulos
    @article=Article.all
  end


  def params_article
    params.require(:article).permit([:name, :price, :description, :foto, :ubicacion, :category_id, :user_id]);
  end   
end
