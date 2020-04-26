class ParticipantsController < ApplicationController
  before_action :set_participant, only: [:update, :edit,:destroy]

  def index
    @participants = Participant.all
  end

  def new
    @participant = Participant.new
  end

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      redirect_to new_participant_path, notice: 'Participante cadastrado com sucesso!'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @participant.update(participant_params)
      redirect_to participants_path, notice: "Participante atualizado com sucesso!"
    else
      render 'edit'
    end
  end

  def destroy
    if @participant.destroy
      redirect_to participants_path, notice: "Participante excluído com sucesso!"
    else
      render 'index'
    end
  end

  private
  def participant_params
    params.require(:participant).permit(:name, :rg)
  end

  def set_participant
    @participant = Participant.find(params[:id])
  end
end
