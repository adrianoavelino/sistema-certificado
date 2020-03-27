class SearchController < ApplicationController
  before_action :set_values, only: [:certificados]

  def certificados
    case @type_selected
    when "titulo"
      @certificados = Certificado.includes(:aluno)
                                 .where("lower(titulo) LIKE ?", "%#{@term.downcase}%")
    when "data_emissao"
      error_message = 'Data inválida. Exemplo: yyyy-mm-dd'
      @certificados = Certificado.none and flash[:error] = error_message and return false unless data_valida?
      @certificados = Certificado.includes(:aluno)
      .where("data_emissao = ?", @term.to_date)

    when "id"
      @certificados = Certificado.includes(:aluno)
                                 .where("id = ?", @term.to_i)
    when "ano"
      @certificados = Certificado.includes(:aluno)
                                 .where("ano = ?", @term)
    when "nome"
      @certificados = Certificado.includes(:aluno)
                                 .where("lower(alunos.nome) LIKE ?", "%#{@term.downcase}%")
                                 .references(:alunos)
    when "evento"
      @certificados = Certificado.includes(:aluno)
                                 .includes(:evento)
                                 .where("lower(eventos.descricao) LIKE ?", "%#{@term.downcase}%")
                                 .references(:eventos)
    else
      @certificados = Certificado.includes(:aluno)
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
