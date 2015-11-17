class AnswersController < ApplicationController
  def new
    @answer=Answer.new
    @answer.content=params[:contenido_respuesta]
    @answer.user_id=params[:id_usuario_respuesta]
    @answer.comment_id=params[:id_comentario]
    @answer.save;
    flash[:notice]="Respuesta exitosa"
    redirect_to articles_path
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
