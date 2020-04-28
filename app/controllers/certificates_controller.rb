class CertificatesController < ApplicationController
  before_action :set_certificate, only: [:edit, :destroy, :update]

  def index
    @certificates = Certificate.all
  end

  def new
    @certificate = Certificate.new
  end

  def create
    @certificate = Certificate.new(certificate_params)
    if @certificate.save
      redirect_to new_certificate_path, notice: "Certificado cadastrado com sucesso!"
    else
      render 'new'
    end
  end

  def destroy
    if @certificate.destroy
      redirect_to certificates_path, notice: 'Certificado excluído com sucesso!'
    else

      render 'index'
    end
  end

  def edit
  end

  def update
    if @certificate.update(certificate_params)
      redirect_to certificates_path, notice: "Certificado atualizado com sucesso!"
    else
      render 'edit'
    end
  end
  private
  def certificate_params
    params.require(:certificate).permit(:year, :date_issue, :participant_id, :event_id, :title, :initial_period, :final_period, :workload, :certification_type_id, :additional_data, :emission_sector_id, :anexo, :observation)
  end

  def set_certificate
    @certificate = Certificate.find(params[:id])
  end
end
