class EventosController < ApplicationController
  before_action :set_evento, only: [:edit, :destroy, :update]
  def index
    @eventos = Evento.all
  end

  def new
    @evento = Evento.new
  end

  def edit
  end

  def update
    if @evento.update(evento_params)
      redirect_to eventos_path, notice: "Evento atualizado com sucesso!"
    else
      render 'edit'
    end
  end

  def create
    @evento = Evento.new(evento_params)
    if @evento.save
      redirect_to new_evento_path, notice: "Evento cadastrado com sucesso!"
    else
      render 'new'
    end
  end

  def destroy
    @evento = Evento.find(params[:id])
    if @evento.destroy
      redirect_to eventos_path, notice: 'Evento excluído com sucesso!'
    else
      render 'index'
    end
  end

  private
  def evento_params
    params.require(:evento).permit(:descricao)
  end

  def set_evento
    @evento = Evento.find(params[:id])
  end
end
