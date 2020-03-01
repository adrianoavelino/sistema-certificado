class EmissionSectorsController < ApplicationController
  before_action :set_emission_sector, only: [:edit, :destroy, :update]
  def index
    @emission_sectors = EmissionSector.all
  end

  def new
    @emission_sector = EmissionSector.new
  end

  def edit
  end

  def update
    if @emission_sector.update(emission_sector_params)
      redirect_to emission_sectors_path, notice: "Setor de Emissão atualizado com sucesso!"
    else
      render 'edit'
    end
  end

  def create
    @emission_sector = EmissionSector.new(emission_sector_params)
    if @emission_sector.save
      redirect_to new_emission_sector_path, notice: "Setor de Emissão cadastrado com sucesso!"
    else
      render 'new'
    end
  end

  def destroy
    @emission_sector = EmissionSector.find(params[:id])
    if @emission_sector.destroy
      redirect_to emission_sectors_path, notice: 'Setor de Emissão excluído com sucesso!'
    else
      render 'index'
    end
  end

  private
  def emission_sector_params
    params.require(:emission_sector).permit(:description)
  end

  def set_emission_sector
    @emission_sector = EmissionSector.find(params[:id])
  end

end
