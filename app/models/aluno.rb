class Aluno < ApplicationRecord
  validates :nome, presence: true
  validates :ra, presence: true
end
