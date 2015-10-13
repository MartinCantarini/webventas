class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :index] 
  def new
        @comment=Comment.new;
        @comment.content=params[:contenido_comentario];
        @comment.article_id=params[:id_articulo_comentario]
        @comment.user_id=params[:id_usuario_comentario]
        @comment.save
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
     @comment.update(params.require(:comment).permit(:content))
  end

  def destroy
    @comment=Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
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
    @comment.save
    redirect_to article_path(@comment.article_id)
  end

end