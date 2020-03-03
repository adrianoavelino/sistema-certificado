class CertificationTypesController < ApplicationController
  before_action :set_certification_type, only: [:edit, :destroy, :update]
  def index
    @certification_types = CertificationType.all
  end

  def new
    @certification_type = CertificationType.new
  end

  def edit
  end

  def update
    if @certification_type.update(certification_type_params)
      redirect_to certification_types_path, notice: 'Tipo de Certificação atualizado com sucesso!'
    else
      render 'edit'
    end
  end

  def create
    @certification_type = CertificationType.new(certification_type_params)
    if @certification_type.save
      redirect_to new_certification_type_path, notice: 'Tipo de Certificação cadastrado com sucesso!'
    else
      render 'new'
    end
  end

  def destroy
    @certification_type = CertificationType.find(params[:id])
    if @certification_type.destroy
      redirect_to certification_types_path, notice: 'Tipo de Certificação excluído com sucesso!'
    else
      render 'index'
    end
  end

  private
  def certification_type_params
    params.require(:certification_type).permit(:description)
  end

  def set_certification_type
    @certification_type = CertificationType.find(params[:id])
  end

end
