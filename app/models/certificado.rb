class Certificado < ApplicationRecord
  belongs_to :aluno
  belongs_to :evento
  belongs_to :certification_type
  belongs_to :emission_sector

  has_one_attached :anexo
  validates :ano, presence: true
  validates :data_emissao, presence: true
  validates :titulo, presence: true
  validates :periodo_inicial, presence: true
  validates :periodo_final, presence: true
  validates :carga_horaria, presence: true
  validates :anexo, attached:true,
    size: { less_than: 1.megabytes },
    content_type: %i[pdf]
end
