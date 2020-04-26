require "./app/services/convert_string_to_array_numbers_service"

class ShippingController < ApplicationController
  def index
    @term = params[:term] || ""
    certification_numbers = ConvertStringToArrayNumbersService.perform(@term)
    @certificados = Certificado.includes(:participant)
                               .where(id: certification_numbers)
                               .order(:id)
  end
end
