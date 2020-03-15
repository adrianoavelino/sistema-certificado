class Certificado < ApplicationRecord
  belongs_to :aluno
  belongs_to :evento
  belongs_to :certification_type
  belongs_to :emission_sector

  has_one_attached :anexo
  validates :anexo, attached:true,
    size: { less_than: 1.megabytes },
    content_type: %i[pdf]
end
