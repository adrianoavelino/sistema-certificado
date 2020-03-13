class CertificadosController < ApplicationController
  before_action :set_certificado, only: [:edit, :destroy, :update]

  def index
    @certificados = Certificado.all
  end

  def new
    @certificado = Certificado.new
  end

  def create
    @certificado = Certificado.new(certificado_params)
    if @certificado.save
      redirect_to new_certificado_path, notice: "Certificado cadastrado com sucesso!"
    else
      render 'new'
    end
  end

  def destroy
    if @certificado.destroy
      redirect_to certificados_path, notice: 'Certificado excluído com sucesso!'
    else

      render 'index'
    end
  end

  def edit
  end

  def update
    if @certificado.update(certificado_params)
      redirect_to certificados_path, notice: "Certificado atualizado com sucesso!"
    else
      render 'edit'
    end
  end
  private
  def certificado_params
    params.require(:certificado).permit(:ano, :data_emissao, :aluno_id, :evento_id, :titulo, :periodo_inicial, :periodo_final, :carga_horaria, :certification_type_id, :dados_adicionais, :emission_sector_id, :observacoes)
  end

  def set_certificado
    @certificado = Certificado.find(params[:id])
  end
end
