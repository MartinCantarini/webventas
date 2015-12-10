class ArticlesController < ApplicationController

  def new
    @article=Article.new;
  end

  def create
    @article=Article.new(params_article)
    article_id=@article.id
    @article.user_id=current_user.id #Aquí se encuntra la mejora mencionada
    if @article.save
      flash[:notice]="Artículo publicado con éxito"
      redirect_to articles_path(article_id)
    else
      flash[:alert] = "No se puedo publicar un nuevo artículo, intente nuevamente en unos segundos"
      redirect_to :root  
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
      #Antes cualquier usuario podía editar el artículo
      @article=Article.find(params[:id])
      #Ahora solo puede hacerlo un usuario registrado y que se dueño del producto
      if (!user_signed_in?)or(@article.user_id!=current_user.id)
        flash[:alert] = "Usted debe estar registrado para ejecutar esta acción"
        redirect_to :root
      end  
  end

  def update
    @article=Article.find(params[:id])
    article_id=@article.id
    @article.update(params_article)
    if @article.save
      flash[:notice]="Artículo actualizado con éxito"
      redirect_to article_path(article_id)
    else
      flash[:alert] = "No se puedo actualizar la información del artículo, intente nuevamente en unos segundos"
      redirect_to :root
     end

  end

  def delete
    @article=Article.find(params[:id])
    @article.destroy
    if @article.save
      flash[:notice] = "Producto eliminado correctamente"
      redirect_to articles_path
    else
      flash.now[:alert] = "No se puedo actualizar la información del artículo, intente nuevamente en unos segundos"
      redirect_to :root 
    end
  end

  def misarticulos
    @article=Article.all
  end

  def add_like
    @article=Article.find(params[:id]);
    @article.likes=@article.likes+1;
    @article.save;
    if(Userlikearticle.haslike(@article.id,current_user.id)=="no")
      @userlikearticle=Userlikearticle.new();
      @userlikearticle.article_id=@article.id;
      @userlikearticle.user_id=current_user.id;
      @userlikearticle.save;
      flash[:notice]="Artículo votado correctamente"
    end
    redirect_to article_path;
  end

  def params_article
    params.require(:article).permit([:name, :price, :description, :foto, :ubicacion, :category_id, :user_id]);
  end   

  def promotions
  end  
end
