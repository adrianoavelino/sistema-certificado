class SearchController < ApplicationController
  before_action :set_values, only: [:certificates]

  def certificates
    case @type_selected
    when "titulo"
      @certificates = Certificate.includes(:participant)
                                 .where("lower(title) LIKE ?", "%#{@term.downcase}%")
    when "data_emissao"
      error_message = 'Data inválida. Exemplo: dd/mm/yyyy'
      @certificates = Certificate.none and flash[:error] = error_message and return false unless data_valida?
      @certificates = Certificate.includes(:participant)
                                 .where("date_issue = ?", @term.to_date)
    when "id"
      @certificates = Certificate.includes(:participant)
                                 .where("id = ?", @term.to_i)
    when "ano"
      @certificates = Certificate.includes(:participant)
                                 .where("year = ?", @term)
    when "nome"
      @certificates = Certificate.includes(:participant)
                                 .where("lower(participants.name) LIKE ?", "%#{@term.downcase}%")
                                 .references(:participants)
    when "evento"
      @certificates = Certificate.includes(:participant)
                                 .includes(:event)
                                 .where("lower(events.description) LIKE ?", "%#{@term.downcase}%")
                                 .references(:events)
    else
      @certificates = Certificate.includes(:participant)
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
