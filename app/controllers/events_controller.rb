class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :destroy, :update]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to events_path, notice: "Evento atualizado com sucesso!"
    else
      render 'edit'
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to new_event_path, notice: "Evento cadastrado com sucesso!"
    else
      render 'new'
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      redirect_to events_path, notice: 'Evento excluído com sucesso!'
    else
      render 'index'
    end
  end

  private
  def event_params
    params.require(:event).permit(:description)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
