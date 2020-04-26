class SearchController < ApplicationController
  before_action :set_values, only: [:certificados]

  def certificados
    case @type_selected
    when "titulo"
      @certificados = Certificado.includes(:participant)
                                 .where("lower(titulo) LIKE ?", "%#{@term.downcase}%")
    when "data_emissao"
      error_message = 'Data inválida. Exemplo: yyyy-mm-dd'
      @certificados = Certificado.none and flash[:error] = error_message and return false unless data_valida?
      @certificados = Certificado.includes(:participant)
      .where("data_emissao = ?", @term.to_date)

    when "id"
      @certificados = Certificado.includes(:participant)
                                 .where("id = ?", @term.to_i)
    when "ano"
      @certificados = Certificado.includes(:participant)
                                 .where("ano = ?", @term)
    when "nome"
      @certificados = Certificado.includes(:participant)
                                 .where("lower(participants.name) LIKE ?", "%#{@term.downcase}%")
                                 .references(:participants)
    when "evento"
      @certificados = Certificado.includes(:participant)
                                 .includes(:event)
                                 .where("lower(events.description) LIKE ?", "%#{@term.downcase}%")
                                 .references(:events)
    else
      @certificados = Certificado.includes(:participant)
    end

  end

  private
  def data_valida?
    return false if ((DateTime.parse(@term) rescue ArgumentError) == ArgumentError)
    true
  end

  def set_values
    @search_types = [
               ["Título", :titulo],
               ["Número", :id],
               ["Ano", :ano],
               ["Nome", :nome],
               ["Evento", :evento],
               ["Data", :data_emissao]
             ]
    @type_selected = params[:type]
    @term = params[:term]
  end
end
