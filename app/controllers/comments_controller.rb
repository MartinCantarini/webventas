class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :index] 
  def new
        @comment=Comment.new;
        @comment.content=params[:contenido_comentario];
        @comment.article_id=params[:id_articulo_comentario]
        @comment.user_id=params[:id_usuario_comentario]
        if @comment.save
          flash[:notice]="Comentario exitoso"
        else
          flash[:alert]"El comentario no se pudo crear, por favor intente nuevamente en unos segundos"
        end
        redirect_to article_path(params[:id_articulo_comentario])
  end

  def create

  end

  def show
  end

  def index
    @comments=Comment.all
  end

  def edit
    @comment=Comment.find(params[:id])
  end

  def update
     @comment=Comment.find(params[:id])
     article_id=@comment.article_id
     @comment.update(params.require(:comment).permit(:content))
     if @comment.save
        flash[:notice]="Comentario actualizado"
        redirect_to article_path(article_id)
     else
        flash[:alert]="El comentario no se pudo actualizar, vuelva a intentarlo nuevamente en unos segudos"  
        redirect_to :root
     end   
  end

  def destroy
    @comment=Comment.find(params[:id])
    article_id=@comment.article_id
    @comment.destroy
    if @comment.save
      flash[:notice]="Comentario eliminado con éxito"
    else
      flash[:alert]="El comentario no pudo ser eliminado, por favor intente nuevamente en unos segundos"
    end     
    redirect_to article_path(article_id)
  end

  def params_comment
     params.require(:comment).permit([:content]);
  end 

  def add_indevido
    @comment=Comment.find(params[:id])
    @cant_indevidos=@comment.cantindevidos
    cant_actual=@cant_indevidos
    cant_nueva=cant_actual+1
    @comment.cantindevidos=cant_nueva
    if @comment.save
      flash[:notice]="Gracias por ayudarnos!"
    else  
      flash[:alert]="El comentario no pudo ser marcado como exitoso, por favor intente nuevamente en unos segundos"
    end
    redirect_to article_path(@comment.article_id)
  end

end