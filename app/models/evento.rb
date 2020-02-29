class Evento < ApplicationRecord
  validates :descricao, presence: true
end
