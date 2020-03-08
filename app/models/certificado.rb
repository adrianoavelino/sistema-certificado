class Certificado < ApplicationRecord
  belongs_to :aluno
  belongs_to :evento
  belongs_to :certification_type
  belongs_to :emission_sector
end
